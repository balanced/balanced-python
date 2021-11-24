# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import sys
import time
from datetime import date

import unittest2 as unittest
import requests

import balanced
from balanced import exc as bexc

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

#: a card which will always create a dispute when you debit it
DISPUTE_CARD = CARD.copy()
DISPUTE_CARD['number'] = '6500000000000002'

CREDITABLE_CARD = {
    'name': 'Johannes Bach',
    'number': '4342561111111118',
    'expiration_month': 05,
    'expiration_year': date.today().year + 1,
}

NON_CREDITABLE_CARD = {
    'name': 'Georg Telemann',
    'number': '4111111111111111',
    'expiration_month': 12,
    'expiration_year': date.today().year + 1,
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
        cls.marketplace, cls.api_key = cls.create_marketplace()

    def setUp(self):
        super(BasicUseCases, self).setUp()
        # some test might rewrite api_key, so we need to configure it
        # here again
        balanced.configure(self.api_key.secret)

    @classmethod
    def create_marketplace(self):
        balanced.configure(None)
        api_key = balanced.APIKey().save()
        balanced.configure(api_key.secret)
        marketplace = balanced.Marketplace().save()
        return marketplace, api_key

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
        self.assertIsNotNone(hold.voided_at)

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
        self.create_marketplace()  # NOTE: fresh mp for escrow checks
        card = balanced.Card(**INTERNATIONAL_CARD).save()
        bank_account = balanced.BankAccount(**BANK_ACCOUNT).save()
        debit = card.debit(amount=10000)
        credit = bank_account.credit(amount=1000)
        self.assertTrue(credit.id.startswith('CR'))
        self.assertEqual(credit.amount, 1000)
        with self.assertRaises(requests.HTTPError) as exc:
            bank_account.credit(amount=(debit.amount - credit.amount) + 1)
        self.assertEqual(exc.exception.status_code, 409)
        self.assertEqual(exc.exception.category_code, 'insufficient-funds')

    def test_credit_existing_card(self):
        funding_card = balanced.Card(**CARD).save()
        card = balanced.Card(**CREDITABLE_CARD).save()
        debit = funding_card.debit(amount=250000)
        credit = card.credit(amount=250000)
        self.assertTrue(credit.id.startswith('CR'))
        self.assertEqual(credit.href, '/credits/{0}'.format(credit.id))
        self.assertEqual(credit.status, 'succeeded')
        self.assertEqual(credit.amount, 250000)

    def test_credit_card_in_request(self):
        funding_card = balanced.Card(**CARD).save()
        debit = funding_card.debit(amount=250000)
        credit = balanced.Credit(
            amount=250000,
            description='A sweet ride',
            destination=CREDITABLE_CARD
        ).save()
        self.assertTrue(credit.id.startswith('CR'))
        self.assertEqual(credit.href, '/credits/{0}'.format(credit.id))
        self.assertEqual(credit.status, 'succeeded')
        self.assertEqual(credit.amount, 250000)
        self.assertEqual(credit.description, 'A sweet ride')

    def test_credit_card_can_credit_false(self):
        funding_card = balanced.Card(**CARD).save()
        debit = funding_card.debit(amount=250000)
        card = balanced.Card(**NON_CREDITABLE_CARD).save()
        with self.assertRaises(bexc.FundingSourceNotCreditable) as exc:
            card.credit(amount=250000)

    def test_credit_card_limit(self):
        funding_card = balanced.Card(**CARD).save()
        debit = funding_card.debit(amount=250005)
        card = balanced.Card(**CREDITABLE_CARD).save()
        with self.assertRaises(requests.HTTPError) as exc:
            credit = card.credit(amount=250001)
        self.assertEqual(exc.exception.status_code, 409)
        self.assertEqual(exc.exception.category_code, 'amount-exceeds-limit')

    def test_credit_card_require_name(self):
        funding_card = balanced.Card(**CARD).save()
        debit = funding_card.debit(amount=250005)
        card_payload = CREDITABLE_CARD.copy()
        card_payload.pop("name")
        card = balanced.Card(**card_payload).save()
        with self.assertRaises(requests.HTTPError) as exc:
            credit = card.credit(amount=250001)
        self.assertEqual(exc.exception.status_code, 400)
        self.assertEqual(exc.exception.category_code, 'name-required-to-credit')

    def test_escrow_limit(self):
        self.create_marketplace()  # NOTE: fresh mp for escrow checks
        bank_account = balanced.BankAccount(**BANK_ACCOUNT).save()
        original_balance = 0
        with self.assertRaises(requests.HTTPError) as exc:
            bank_account.credit(amount=original_balance + 1)
        ex = exc.exception
        self.assertEqual(ex.status_code, 409)
        self.assertEqual(ex.category_code, 'insufficient-funds')

    def test_slice_syntax(self):
        total_debit = balanced.Debit.query.count()
        self.assertNotEqual(total_debit, 2)
        self.assertEqual(len(balanced.Debit.query), total_debit)
        sliced_debits = balanced.Debit.query[:2]
        self.assertEqual(len(sliced_debits), 2)
        for debit in sliced_debits:
            self.assertIsInstance(debit, balanced.Debit)
        all_debits = balanced.Debit.query.all()
        last = total_debit * -1
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
        # NOTE: we need a whole new marketplace to reproduce the bug,
        # otherwise, it's very likely we will consume records created
        # by other tests
        self.create_marketplace()
        self.assertEqual(balanced.Credit.query.all(), [])

    def test_query_pagination(self):
        card = balanced.Card(**CARD).save()
        for _ in xrange(30): card.debit(amount=100)
        self.assertEqual(len(balanced.Debit.query.all()), balanced.Debit.query.count())

    def test_dispute(self):
        card = balanced.Card(**DISPUTE_CARD).save()
        debit = card.debit(amount=100)

        # TODO: this is ugly, I think we should provide a more
        # reliable way to generate dispute, at least it should not
        # take this long
        print >> sys.stderr, (
            'It takes a while before the dispute record created, '
            'take and nap and wake up, then it should be done :/ '
            '(last time I tried it took 10 minutes...)'
        )
        timeout = 12 * 60
        interval = 10
        begin = time.time()
        while True:
            if balanced.Dispute.query.count():
                break
            time.sleep(interval)
            elapsed = time.time() - begin
            print >> sys.stderr, 'Polling disputes..., elapsed', elapsed
            self.assertLess(elapsed, timeout, 'Ouch, timeout')

        dispute = balanced.Dispute.query.one()
        self.assertEqual(dispute.status, 'pending')
        self.assertEqual(dispute.reason, 'fraud')
        self.assertEqual(dispute.transaction.id, debit.id)

    def test_external_accounts(self):
        external_account = balanced.ExternalAccount(
            token='123123123',
            provider='name_of_provider',
        ).save()
        debit = external_account.debit(
            amount=1234
        )
        self.assertEqual(debit.source.id, external_account.id)

    def test_general_resources(self):
        card = balanced.Card(**CARD).save()
        customer = balanced.Customer().save()
        card.associate_to_customer(customer)
        debit = card.debit(amount=1000)
        self.assertIsNotNone(debit)
        self.assertIsNotNone(debit.source)
        self.assertTrue(isinstance(debit.source, balanced.Card))

    def test_get_none_for_none(self):
        card = balanced.Card(**CARD).save()
        customer = balanced.Customer().save()
        self.assertIsNone(card.customer)
        card.associate_to_customer(customer)
        card = balanced.Card.get(card.href)
        self.assertIsNotNone(card.customer)
        self.assertTrue(isinstance(card.customer, balanced.Customer))

    def test_accounts_credit(self):
        merchant = balanced.Customer().save()
        order = merchant.create_order()
        card = balanced.Card(**INTERNATIONAL_CARD).save()

        order.debit_from(source=card, amount=1234)
        payable_account = merchant.payable_account
        self.assertEqual(payable_account.balance, 0)
        account_credit = payable_account.credit(
            amount=1234, order=order.href,
            appears_on_statement_as='Payout')
        payable_account = merchant.payable_account
        self.assertEqual(account_credit.status, 'succeeded')
        self.assertEqual(payable_account.balance, 1234)
        self.assertEqual(account_credit.appears_on_statement_as, 'Payout')

    def test_accounts_credit_from_multiple_orders(self):
        merchant = balanced.Customer().save()
        card = balanced.Card(**INTERNATIONAL_CARD).save()
        payable_account = merchant.payable_account
        self.assertEqual(payable_account.balance, 0)
        amount = 1234

        order_one = merchant.create_order()
        order_one.debit_from(source=card, amount=amount)
        payable_account.credit(amount=amount, order=order_one.href)
        payable_account = merchant.payable_account
        self.assertEqual(payable_account.balance, amount)
        order_two = merchant.create_order()
        order_two.debit_from(source=card, amount=amount)
        payable_account.credit(amount=amount, order=order_two.href)
        payable_account = merchant.payable_account
        self.assertEqual(payable_account.balance, amount*2)

    def test_settlement(self):
        merchant = balanced.Customer().save()
        order = merchant.create_order()
        card = balanced.Card(**INTERNATIONAL_CARD).save()

        order.debit_from(source=card, amount=1234)
        payable_account = merchant.payable_account
        payable_account.credit(
            amount=1234, order=order.href, appears_on_statement_as='Payout')
        payable_account = merchant.payable_account
        self.assertEqual(payable_account.balance, 1234)
        bank_account = balanced.BankAccount(
            account_number='1234567890',
            routing_number='321174851',
            name='Someone',
            ).save()
        bank_account.associate_to_customer(merchant)

        settlement = payable_account.settle(
            funding_instrument=bank_account.href,
            appears_on_statement_as="Settlement Oct",
            description="Settlement for payouts from October")
        self.assertEqual(settlement.amount, 1234)
        self.assertEqual(settlement.appears_on_statement_as,
                         "BAL*Settlement Oct")
        self.assertEqual(settlement.description,
                         "Settlement for payouts from October")
        payable_account = merchant.payable_account
        self.assertEqual(payable_account.balance, 0)

    def test_settle_reverse_account_credit(self):
        merchant = balanced.Customer().save()
        order = merchant.create_order()
        card = balanced.Card(**INTERNATIONAL_CARD).save()

        order.debit_from(source=card, amount=1234)
        payable_account = merchant.payable_account
        account_credit = payable_account.credit(
            amount=1234, order=order.href, appears_on_statement_as='Payout')
        payable_account = merchant.payable_account
        self.assertEqual(payable_account.balance, 1234)

        bank_account = balanced.BankAccount(
            account_number='1234567890',
            routing_number='321174851',
            name='Someone',
            ).save()
        bank_account.associate_to_customer(merchant)

        payable_account.settle(
            funding_instrument=bank_account.href,
            appears_on_statement_as="Settlement Oct",
            description="Settlement for payouts from October")
        payable_account = merchant.payable_account
        self.assertEqual(payable_account.balance, 0)

        order_two = merchant.create_order()
        order_two.debit_from(source=card, amount=1234)
        payable_account.credit(amount=1234, order=order_two.href)

        payable_account = merchant.payable_account
        self.assertEqual(payable_account.balance, 1234)

        account_credit.reverse(amount=1234)
        payable_account = merchant.payable_account
        self.assertEqual(payable_account.balance, 0)

    def test_settle_account_negative_balance(self):
        merchant = balanced.Customer().save()
        order = merchant.create_order()
        card = balanced.Card(**INTERNATIONAL_CARD).save()

        order.debit_from(source=card, amount=1234)
        payable_account = merchant.payable_account
        account_credit = payable_account.credit(
            amount=1234, order=order.href, appears_on_statement_as='Payout')
        bank_account = balanced.BankAccount(
            account_number='1234567890',
            routing_number='321174851',
            name='Someone',
            ).save()
        bank_account.associate_to_customer(merchant)

        payable_account.settle(
            funding_instrument=bank_account.href,
            appears_on_statement_as="Settlement Oct",
            description="Settlement for payouts from October")
        payable_account = merchant.payable_account
        self.assertEqual(payable_account.balance, 0)

        account_credit.reverse(amount=1234)
        payable_account = merchant.payable_account
        self.assertEqual(payable_account.balance, -1234)

        payable_account.settle(
            funding_instrument=bank_account.href,
            appears_on_statement_as="Settlement Oct",
            description="Settlement for payouts from October")
        payable_account = merchant.payable_account
        self.assertEqual(payable_account.balance, 0)


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
        args = dict(
            mp=marketplace,
            customer=customer,
        )
        for pattern in [
            '/v1/customers/{customer.id}',
            '/v1/marketplaces/{mp.id}/accounts/{customer.id}',
        ]:
            yield pattern.format(**args)

    @classmethod
    def _iter_card_uris(cls, marketplace, customer, card):
        args = dict(
            mp=marketplace,
            customer=customer,
            card=card,
        )
        for pattern in [
            '/v1/customers/{customer.id}/cards/{card.id}',
            '/v1/marketplaces/{mp.id}/cards/{card.id}',
            '/v1/marketplaces/{mp.id}/accounts/{customer.id}/cards/{card.id}',
        ]:
            yield pattern.format(**args)

    @classmethod
    def _iter_bank_account_uris(cls, marketplace, customer, bank_account):
        args = dict(
            mp=marketplace,
            customer=customer,
            bank_account=bank_account,
        )
        for pattern in [
            '/v1/customers/{customer.id}/bank_accounts/{bank_account.id}',
            '/v1/marketplaces/{mp.id}/bank_accounts/{bank_account.id}',
            '/v1/marketplaces/{mp.id}/accounts/{customer.id}/bank_accounts/{bank_account.id}',
        ]:
            yield pattern.format(**args)

    def assert_not_rev0(self, resource):
        """Ensures the given resource is not in revision 0 format

        """
        self.assert_(not hasattr(resource, '_uris'))

    def test_marketplace(self):
        uri = '/v1/marketplaces/{0}'.format(self.marketplace.id)
        marketplace = balanced.Marketplace.fetch(uri)
        self.assertEqual(marketplace.id, self.marketplace.id)
        self.assert_not_rev0(marketplace)

    def test_customer(self):
        customer = balanced.Customer().save()
        for uri in self._iter_customer_uris(
            marketplace=self.marketplace,
            customer=customer,
        ):
            result_customer = balanced.Customer.fetch(uri)
            self.assertEqual(result_customer.id, customer.id)
            self.assert_not_rev0(result_customer)

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
