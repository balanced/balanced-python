# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import sys
import time
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

#: a card which will always create a dispute when you debit it
DISPUTE_CARD = CARD.copy()
DISPUTE_CARD['number'] = '6500000000000002'

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

    def test_operating_account_go_negative(self):
        customer = balanced.Customer().save()
        customer.accounts.create(
            account_type=balanced.Account.OPERATING,
            description='Redeemable balances migration'
        )
        acct = customer.operating_account
        self.assertEqual(acct.balance, 0)
        debit = acct.debit(amount=1000)
        self.assertEqual(debit.amount, 1000)
        self.assertEqual(debit.status, 'succeeded')
        acct = customer.operating_account
        self.assertEqual(acct.balance, -1000)

    def test_deposit_account_no_negative(self):
        customer = balanced.Customer().save()
        customer.accounts.create(
            account_type=balanced.Account.DEPOSIT,
            description='Example description'
        )

        card = balanced.Card(**INTERNATIONAL_CARD).save()
        card.debit(1000)

        acct = customer.deposit_account
        self.assertEqual(acct.balance, 0)

        with self.assertRaises(balanced.exc.BalancedError):
            acct.debit(amount=1000)

        acct = customer.deposit_account
        self.assertEqual(acct.balance, 0)

        credit = acct.credit(amount=1000)
        self.assertEqual(credit.amount, 1000)
        self.assertEqual(credit.status, 'succeeded')
        acct = customer.deposit_account
        self.assertEqual(acct.balance, 1000)

    def test_line_of_credit_account_only_negative(self):
        customer = balanced.Customer().save()
        customer.accounts.create(
            account_type=balanced.Account.LINE_OF_CREDIT,
            description='Overweight shipping'
        )

        acct = customer.line_of_credit_account
        self.assertEqual(acct.balance, 0)

        with self.assertRaises(balanced.exc.BalancedError):
            acct.credit(amount=1000)

        card = balanced.Card(**INTERNATIONAL_CARD).save()
        card.debit(1000)

        acct = customer.line_of_credit_account
        self.assertEqual(acct.balance, 0)

        debit = acct.debit(amount=1000)
        self.assertEqual(debit.amount, 1000)
        self.assertEqual(debit.status, 'succeeded')
        acct = customer.line_of_credit_account
        self.assertEqual(acct.balance, -1000)

    def test_query_accounts_via_meta(self):
        customer = balanced.Customer().save()
        for i in xrange(2):
            customer.accounts.create(
                account_type=balanced.Account.OPERATING,
                description='Operating account {0}'.format(i),
                meta={
                    'tag': 'account-number-{0}'.format(i)
                }
            )
        acct = customer.accounts.filter(**{'meta.tag': 'account-number-1'}).first()
        self.assertIsNotNone(acct)
        self.assertEqual(acct.meta['tag'], 'account-number-1')
        self.assertEqual(acct.description, 'Operating account 1')
        self.assertEqual(len(customer.accounts), 3)

    def test_transfer(self):
        seller = balanced.Customer().save()
        bank_account = balanced.BankAccount(**BANK_ACCOUNT).save()
        bank_account.associate_to_customer(seller)

        account = seller.deposit_account

        buyer = balanced.Customer().save()
        card = balanced.Card(**INTERNATIONAL_CARD).save()
        card.associate_to_customer(buyer)

        order = seller.create_order(description='foo order')

        amount = 124
        initial_balance = account.balance

        order.debit_from(source=card, amount=amount)

        order = balanced.Order.fetch(order.href)
        self.assertEqual(order.amount_escrowed, amount)

        order.credit_to(destination=account, amount=amount)

        # Withdraw from Balanced to a bank account
        withdrawal = account.transfer_to(
            destination=bank_account,
            amount=amount
        )

        self.assertEqual(withdrawal.amount, amount)
        self.assertIsInstance(withdrawal, balanced.Transfer)
        account = seller.deposit_account
        self.assertEqual(account.balance, initial_balance)

    def test_empty_list(self):
        # NOTE: we need a whole new marketplace to reproduce the bug,
        # otherwise, it's very likely we will consume records created
        # by other tests
        self.create_marketplace()
        self.assertEqual(balanced.Credit.query.all(), [])

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
        """Ensures the given resouce is not in revision 0 format

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
