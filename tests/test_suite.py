# -*- coding: utf-8 -*-

from __future__ import unicode_literals
from datetime import date

import unittest2 as unittest
import requests

import balanced


# fixtures

TEST_CARDS = {
    'visa': [
        '4112344112344113',
        '4110144110144115',
        '4114360123456785',
        '4061724061724061',
    ],
    'mastercard': [
        '5111005111051128'
        '5112345112345114'
        '5115915115915118'
        '5116601234567894'
    ],
    'amex': [
        '371144371144376',
        '341134113411347',
    ],
    'discover': [
        '6011016011016011',
        '6559906559906557',
    ]
}

PERSON = {
    'name': 'William James',
    'address': {
        'line1': '167 West 74th Street',
        'line2': 'Apt 7',
        'state': 'NY',
        'city': 'NYC',
        'postal_code': '10023',
        'country_code': 'USA',
    },
    'dob': '1842-12',
    'phone': '+16505551234',
    'email': 'python-client@example.org',
}

BUSINESS = PERSON.copy()
BUSINESS['ein'] = '123456789'
BUSINESS['business_name'] = 'Foo corp'

CARD = {
    'name': 'Johnny Fresh',
    'number': '4444424444444440',
    'expiration_month': 12,
    'expiration_year': date.today().year + 1,
    'csc': '123',
    'address': {
        'line1': '123 Fake Street',
        'line2': 'Apt 7',
        'city': 'Jollywood',
        'state': 'CA',
        'postal_code': '90210',
        'country_code': 'US',
    }
}

INTERNATIONAL_CARD = {
    'name': 'Johnny Fresh',
    'number': '4444424444444440',
    'expiration_month': 12,
    'expiration_year': date.today().year + 1,
    'address': {
        'street_address': '田原３ー８ー１',
        'city': '都留市',
        'state': '山梨県',
        'postal_code': '4020054',
        'country_code': 'JPN',
    }
}

BANK_ACCOUNT = {
    'name': 'Homer Jay',
    'account_number': '112233a',
    'routing_number': '121042882',
}

BANK_ACCOUNT_W_TYPE = {
    'name': 'Homer Jay',
    'account_number': '112233a',
    'routing_number': '121042882',
    'type': 'checking'
}


class BasicUseCases(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        # ensure we won't consume API key from other test case
        balanced.configure()
        cls.api_key = balanced.APIKey().save()
        balanced.configure(cls.api_key.secret)
        cls.marketplace = balanced.Marketplace().save()

    def setUp(self):
        super(BasicUseCases, self).setUp()
        # some test might rewrite api_key, so we need to configure it
        # here again
        balanced.configure(self.api_key.secret)

    def test_create_a_second_marketplace_should_fail(self):
        with self.assertRaises(requests.HTTPError) as exc:
            balanced.Marketplace().save()
        the_exception = exc.exception
        self.assertEqual(the_exception.status_code, 409)

    def test_index_the_marketplaces(self):
        self.assertEqual(balanced.Marketplace.query.count(), 1)

    def test_create_a_customer(self):
        meta = {'test#': 'test_d'}
        card = balanced.Card(**CARD).save()
        buyer = balanced.Customer(
            source=card,
            meta=meta,
            **PERSON
        ).save()
        self.assertEqual(buyer.name, PERSON['name'])
        self.assertIsNotNone(buyer.created_at)
        self.assertIsNotNone(buyer.href)
        self.assertEqual(buyer.cards.count(), 1)
        self.assertEqual(buyer.cards.first().id, card.id)

    def test_debit_a_card_and_refund(self):
        card = balanced.Card(**CARD).save()
        debit = card.debit(
            amount=1000,
            appears_on_statement_as='atest',
            meta={'fraud': 'yes'},
            description='Descripty')
        self.assertTrue(debit.id.startswith('W'))
        self.assertEqual(debit.description, 'Descripty')
        self.assertEqual(debit.appears_on_statement_as, 'BAL*atest')

        refund = debit.refund(amount=100)
        self.assertTrue(refund.id.startswith('RF'))
        self.assertEqual(refund.debit.href, debit.href)

        another_debit = card.debit(
            amount=1000,
            meta={'fraud': 'yes'})
        self.assertEqual(another_debit.appears_on_statement_as,
                         'BAL*example.com')

        another_debit.refund()

    def test_create_hold_and_void_it(self):
        card = balanced.Card(**CARD).save()
        hold = card.hold(amount=1500, description='Hold me')
        self.assertEqual(hold.description, 'Hold me')
        hold.cancel()

    def test_create_hold_and_capture_it(self):
        card = balanced.Card(**CARD).save()
        hold = card.hold(amount=1500)
        self.assertTrue(hold.id.startswith('HL'))
        debit = hold.capture()
        self.assertEqual(debit.amount, 1500)

    def test_create_a_person_customer(self):
        customer = balanced.Customer(**PERSON).save()
        for key, value in PERSON.iteritems():
            if key == 'dob':
                continue
            if isinstance(value, dict):
                self.assertDictEqual(getattr(customer, key), value)
            else:
                self.assertEqual(getattr(customer, key), value)

    def test_create_a_business_customer(self):
        customer = balanced.Customer(**BUSINESS).save()
        for key, value in BUSINESS.iteritems():
            if key == 'dob':
                continue
            if isinstance(value, dict):
                self.assertDictEqual(getattr(customer, key), value)
            else:
                self.assertEqual(getattr(customer, key), value)

    def test_credit_a_bank_account(self):
        card = balanced.Card(**INTERNATIONAL_CARD).save()
        bank_account = balanced.BankAccount(**BANK_ACCOUNT).save()
        card.debit(amount=10000)
        original_balance = balanced.Marketplace.mine.in_escrow
        credit = bank_account.credit(amount=1000)
        self.assertTrue(credit.id.startswith('CR'))
        self.assertEqual(credit.amount, 1000)
        self.assertEqual(
            balanced.Marketplace.mine.in_escrow,
            original_balance - credit.amount)

    def test_escrow_limit(self):
        bank_account = balanced.BankAccount(**BANK_ACCOUNT).save()
        original_balance = balanced.Marketplace.mine.in_escrow
        with self.assertRaises(requests.HTTPError) as exc:
            bank_account.credit(amount=original_balance + 1)
        the_exception = exc.exception
        self.assertEqual(the_exception.status_code, 409)

    def test_slice_syntax(self):
        total_debit = balanced.Debit.query.count()
        self.assertNotEqual(total_debit, 2)
        self.assertEqual(len(balanced.Debit.query), total_debit)
        sliced_debits = balanced.Debit.query[:2]
        self.assertEqual(len(sliced_debits), 2)
        for debit in sliced_debits:
            self.assertIsInstance(debit, balanced.Debit)
        all_debits = balanced.Debit.query.all()
        last = total_debit * - 1
        for index, debit in enumerate(all_debits):
            self.assertEqual(debit.href,
                             balanced.Debit.query[last + index].href)

    def test_filter_and_sort(self):
        card = balanced.Card(**INTERNATIONAL_CARD).save()
        debits = [
            card.debit(amount=1122, meta={'tag': meta})
            for meta in ('1', '1', '2')
        ]

        for meta in ('1', '2'):
            debs = balanced.Debit.query.filter(
                balanced.Debit.f.meta.tag == meta
            )
            self.assertItemsEqual(
                [deb.id for deb in debs],
                [deb.id for deb in debits if deb.meta['tag'] == meta]
            )

        debs = balanced.Debit.query.filter(
            balanced.Debit.f.meta.contains('tag')
        ).sort(balanced.Debit.f.amount.asc())
        self.assertEqual(len(debs), 3)
        self.assertItemsEqual([deb.id for deb in debs],
                              [deb.id for deb in debits])

    def test_create_international_card(self):
        card = balanced.Card(**INTERNATIONAL_CARD).save()
        self.assertTrue(card.id.startswith('CC'))

    def test_credit_bank_account(self):
        card = balanced.Card(**INTERNATIONAL_CARD).save()
        card.debit(50)
        bank_account = balanced.BankAccount(**BANK_ACCOUNT_W_TYPE).save()
        cr = bank_account.credit(50)
        self.assertEqual(cr.amount, 50)

    def test_reverse_a_credit(self):
        card = balanced.Card(**INTERNATIONAL_CARD).save()
        card.debit(5000)
        bank_account = balanced.BankAccount(**BANK_ACCOUNT_W_TYPE).save()
        credit = bank_account.credit(amount=5000)
        reversal = credit.reverse()
        self.assertEqual(reversal.amount, 5000)
        self.assertIn(credit.id, reversal.credit.href)

    def test_delete_bank_account(self):
        customer = balanced.Customer().save()
        bank_account = balanced.BankAccount(**BANK_ACCOUNT_W_TYPE).save()
        bank_account.associate_to_customer(customer)
        bank_account.unstore()

    def test_delete_card(self):
        customer = balanced.Customer().save()
        card = balanced.Card(**CARD).save()
        card.associate_to_customer(customer)
        card.unstore()

    def test_fetch_resource(self):
        customer = balanced.Customer().save()
        customer2 = balanced.Customer.fetch(customer.href)
        for prop in ('id', 'href', 'name', 'created_at'):
            self.assertEqual(
                getattr(customer, prop),
                getattr(customer2, prop),
            )

    def test_order(self):
        merchant = balanced.Customer().save()
        bank_account = balanced.BankAccount(**BANK_ACCOUNT).save()
        bank_account.associate_to_customer(merchant)

        order = merchant.create_order(description='foo order')

        card = balanced.Card(**INTERNATIONAL_CARD).save()

        # debit to increment escrow
        card.debit(amount=1000)

        # debit the card and associate with the order.
        card.debit(amount=100, order=order)

        order = balanced.Order.fetch(order.href)

        # the order captured the amount of the debit
        self.assertEqual(order.amount_escrowed, 100)

        # pay out half
        credit = bank_account.credit(amount=50, order=order)

        self.assertEqual(credit.order.href, order.href)

        order = balanced.Order.fetch(order.href)

        # half the money remains
        self.assertEqual(order.amount_escrowed, 50)

        # not enough money in the order to pay out
        with self.assertRaises(balanced.exc.BalancedError):
            bank_account.credit(amount=150, order=order)

    def test_order_restrictions(self):
        merchant = balanced.Customer().save()

        order = merchant.create_order(description='foo order')

        card = balanced.Card(**INTERNATIONAL_CARD).save()

        # debit the card and associate with the order.
        card.debit(amount=100, order=order)

        another_bank_account = balanced.BankAccount(
            account_number="1234567890",
            routing_number="321174851",
            name="Jack Q Merchant",
        ).save()

        # not associated with the order
        with self.assertRaises(balanced.exc.BalancedError):
            another_bank_account.credit(amount=50, order=order)

    def test_order_helper_methods(self):
        merchant = balanced.Customer().save()
        order = merchant.create_order()
        card = balanced.Card(**INTERNATIONAL_CARD).save()

        order.debit_from(source=card, amount=1234)
        bank_account = balanced.BankAccount(
            account_number='1234567890',
            routing_number='321174851',
            name='Someone',
        ).save()
        bank_account.associate_to_customer(merchant)
        order.credit_to(destination=bank_account, amount=1234)

    def test_empty_list(self):
        # Notice: we need a whole new marketplace to reproduce the bug,
        # otherwise, it's very likely we will consume records created
        # by other tests
        balanced.configure(None)
        api_key = balanced.APIKey().save()
        balanced.configure(api_key.secret)
        balanced.Marketplace().save()
        self.assertEqual(balanced.Credit.query.all(), [])


class Rev0URIBasicUseCases(unittest.TestCase):
    """This test case ensures all revision 0 URIs can work without a problem 
    with current revision 1 client

    """

    @classmethod
    def setUpClass(cls):
        # ensure we won't consume API key from other test case
        balanced.configure()
        cls.api_key = balanced.APIKey().save()
        balanced.configure(cls.api_key.secret)
        cls.marketplace = balanced.Marketplace().save()

    @classmethod
    def _iter_customer_uris(cls, marketplace, customer):
        for uri in [
            '/v1/customers/{}'.format(customer.id),
            '/v1/marketplaces/{}/accounts/{}'.format(marketplace.id, customer.id),
        ]:
            yield uri

    @classmethod
    def _iter_card_uris(cls, marketplace, customer, card):
        for uri in [
            '/v1/customers/{}/cards/{}'.format(customer.id, card.id),
            '/v1/marketplaces/{}/cards/{}'.format(marketplace.id, card.id),
            '/v1/marketplaces/{}/accounts/{}/cards/{}'.format(
                marketplace.id, customer.id, card.id,
            )
        ]:
            yield uri

    @classmethod
    def _iter_bank_account_uris(cls, marketplace, customer, bank_account):
        for uri in [
            '/v1/customers/{}/bank_accounts/{}'.format(customer.id, bank_account.id),
            '/v1/marketplaces/{}/bank_accounts/{}'.format(marketplace.id, bank_account.id),
            '/v1/marketplaces/{}/accounts/{}/bank_accounts/{}'.format(
                marketplace.id, customer.id, bank_account.id,
            )
        ]:
            yield uri

    def test_marketplace(self):
        uri = '/v1/marketplaces/{}'.format(self.marketplace.id)
        marketplace = balanced.Marketplace.fetch(uri)
        self.assertEqual(marketplace.id, self.marketplace.id)

    def test_customer(self):
        customer = balanced.Customer().save()
        for uri in self._iter_customer_uris(
            marketplace=self.marketplace,
            customer=customer, 
        ):
            result_customer = balanced.Customer.fetch(uri)
            self.assertEqual(result_customer.id, customer.id)

    def test_associate_card(self):
        customer = balanced.Customer().save()
        cards = set()
        for uri in self._iter_customer_uris(
            marketplace=self.marketplace,
            customer=customer, 
        ):
            card = balanced.Card(**CARD).save()
            card.customer = uri
            card.save()
            cards.add(card.href)
        customer_cards = set(card.href for card in customer.cards)
        self.assertEqual(cards, customer_cards)

    def test_associate_bank_account(self):
        customer = balanced.Customer().save()
        bank_accounts = set()
        for uri in self._iter_customer_uris(
            marketplace=self.marketplace,
            customer=customer, 
        ):
            bank_account = balanced.BankAccount(**BANK_ACCOUNT).save()
            bank_account.customer = uri
            bank_account.save()
            bank_accounts.add(bank_account.href)

        customer_bank_accounts = set(
            bank_account.href for bank_account in customer.bank_accounts
        )
        self.assertEqual(bank_accounts, customer_bank_accounts)

    def test_set_default_card(self):
        customer = balanced.Customer().save()
        card1 = balanced.Card(**CARD).save()
        card1.associate_to_customer(customer)
        card2 = balanced.Card(**CARD).save()
        card2.associate_to_customer(customer)
        # set card 1 as the default source
        customer.source = card1.href
        customer.save()
        self.assertEqual(customer.source.href, card1.href)
        for uri in self._iter_card_uris(
            marketplace=self.marketplace,
            customer=customer,
            card=card2,
        ):
            # set the source to card2 via rev0 URI
            customer.source = uri
            customer.save()
            self.assertEqual(customer.source.href, card2.href)

            # set the source back to card1
            customer.source = card1.href
            customer.save()
            self.assertEqual(customer.source.href, card1.href)

    def test_set_default_bank_account(self):
        customer = balanced.Customer().save()
        bank_account1 = balanced.BankAccount(**BANK_ACCOUNT).save()
        bank_account1.associate_to_customer(customer)
        bank_account2 = balanced.BankAccount(**BANK_ACCOUNT).save()
        bank_account2.associate_to_customer(customer)
        # set bank account 1 as the default destination
        customer.destination = bank_account1.href
        customer.save()
        self.assertEqual(customer.destination.href, bank_account1.href)
        for uri in self._iter_bank_account_uris(
            marketplace=self.marketplace,
            customer=customer,
            bank_account=bank_account2,
        ):
            # set the destination to bank_account2 via rev0 URI
            customer.destination = uri
            customer.save()
            self.assertEqual(customer.destination.href, bank_account2.href)

            # set the destination back to bank_account1
            customer.destination = bank_account1.href
            customer.save()
            self.assertEqual(customer.destination.href, bank_account1.href)

    def test_debit(self):
        customer = balanced.Customer().save()
        card = balanced.Card(**CARD).save()
        card.associate_to_customer(customer)
        for uri in self._iter_card_uris(
            marketplace=self.marketplace,
            customer=customer,
            card=card,
        ):
            debit = balanced.Debit(amount=100, source=uri).save()
            self.assertEqual(debit.source.href, card.href)
            self.assertEqual(debit.amount, 100)

    def test_credit(self):
        # make sufficient amount for credit later
        card = balanced.Card(**CARD).save()
        card.debit(amount=1000000)

        customer = balanced.Customer().save()
        bank_account = balanced.BankAccount(**BANK_ACCOUNT).save()
        bank_account.associate_to_customer(customer)
        for uri in self._iter_bank_account_uris(
            marketplace=self.marketplace,
            customer=customer,
            bank_account=bank_account,
        ):
            credit = balanced.Credit(amount=100, destination=uri).save()
            self.assertEqual(credit.destination.href, bank_account.href)
            self.assertEqual(credit.amount, 100)
