# -*- coding: utf-8 -*-


import mock
import warnings
import re

import unittest
import requests

import balanced
from balanced.exc import NoResultFound, MoreInformationRequiredError


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
    ]}

PERSON_MERCHANT = {
    'type': 'person',
    'name': 'William James',
    'tax_id': '393-48-3992',              # Should work w/ and w/o dashes
    'street_address': '167 West 74th Street',
    'postal_code': '10023',
    'dob': '1842-01-01',
    'phone_number': '+16505551234',
    'country_code': 'USA',
    }

BUSINESS_PRINCIPAL = {
    'name': 'William James',
    'tax_id': '393483992',
    'street_address': '167 West 74th Street',
    'postal_code': '10023',
    'dob': '1842-01-01',
    'phone_number': '+16505551234',
    'country_code': 'USA',
    }

BUSINESS_MERCHANT = {
    'type': 'business',
    'name': 'Levain Bakery',
    'tax_id': '253912384',
    'street_address': '167 West 74th Street',
    'postal_code': '10023',
    'phone_number': '+16505551234',
    'country_code': 'USA',
    'person': BUSINESS_PRINCIPAL,
    }

CARD = {
    'street_address': '123 Fake Street',
    'city': 'Jollywood',
    'region': 'CA',
    'postal_code': '90210',
    'name': 'Johnny Fresh',
    'card_number': '4444424444444440',
    'expiration_month': 12,
    'expiration_year': 2013,
    }

INTERNATIONAL_CARD = {
    'street_address': '田原３ー８ー１',
    'city': '都留市',
    'region': '山梨県',
    'postal_code': '4020054',
    'country_code': 'JPN',
    'name': 'Johnny Fresh',
    'card_number': '4444424444444440',
    'expiration_month': 12,
    'expiration_year': 2014,
    }

BANK_ACCOUNT = {
    'name': 'Homer Jay',
    'account_number': '112233a',
    'bank_code': '121042882',
    }

PERSON_FAILING_KYC = {
    'type': 'person',
    'name': 'William James',
    'dob': '1842-01-01',
    'phone_number': '+16505551234',
    'street_address': '801 High St',
    'postal_code': '99999',
    'region': 'EX',
    'country_code': 'USA',
    }

BANK_ACCOUNT_W_TYPE = {
    'name': 'Homer Jay',
    'account_number': '112233a',
    'routing_number': '121042882',
    'type': 'checking'
}

CREDIT = {
    'amount': 9876,
    'description': 'I love money',
}


# tests

class BasicUseCases(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        balanced.config.root_uri = 'http://127.0.0.1:5000/'
        if not balanced.config.api_key_secret:
            api_key = balanced.APIKey().save()
            balanced.configure(api_key.secret)
            cls.merchant = api_key.merchant

    def test_00_merchant_expectations(self):
        self.assertFalse(hasattr(self.merchant, 'principal'))
        self.assertFalse(hasattr(self.merchant, 'payout_method'))
        self.assertTrue(self.merchant.id.startswith('TEST-MR'))

    def test_01_create_marketplace(self):
        self.assertTrue(self.merchant.accounts_uri.endswith('/accounts'))
        self.assertIsNotNone(balanced.config.api_key_secret)
        marketplace = balanced.Marketplace().save()
        self.assertTrue(marketplace.id.startswith('TEST-MP'))
        self.merchant = balanced.Merchant.find(self.merchant.uri)
        self.assertEqual(marketplace.in_escrow, 0)

    def test_02_create_a_second_marketplace_should_fail(self):
        self.assertIsNotNone(balanced.config.api_key_secret)
        with self.assertRaises(requests.HTTPError) as exc:
            balanced.Marketplace().save()
        the_exception = exc.exception
        self.assertEqual(the_exception.status_code, 409)

    def test_03_index_the_marketplaces(self):
        self.assertIsNotNone(balanced.config.api_key_secret)
        mps = balanced.Marketplace.query.all()
        self.assertEqual(len(mps), 1)

    def _create_marketplace(self):
        try:
            return balanced.Marketplace.query.one()
        except NoResultFound:
            return balanced.Marketplace().save()

    def _find_marketplace(self):
        return balanced.Marketplace.query.one()

    def test_04_create_a_buyer(self):
        self.assertIsNotNone(balanced.config.api_key_secret)

        card_number = TEST_CARDS['visa'][0]
        buyer_name = 'khalkhalash onastick'
        card_payload = {
            'street_address': '123 Fake Street',
            'city': 'Jollywood',
            'state': 'CA',
            'postal_code': '90210',
            'name': buyer_name,
            'card_number': card_number,
            'expiration_month': 12,
            'expiration_year': 2013,
            }
        card = balanced.Card(**card_payload).save()
        card_uri = card.uri
        mp = self._find_marketplace()

        buyer = mp.create_buyer(email_address='m@poundpay.com',
            card_uri=card_uri,
            meta={'test#': 'test_d'}
        )
        self.assertTrue(buyer.id.startswith('AC'), buyer.id)
        self.assertEqual(buyer.name, 'khalkhalash onastick')
        self.assertEqual(buyer.roles, ['buyer'])
        self.assertIsNotNone(buyer.created_at)
        self.assertDictEqual(buyer.meta, {'test#': 'test_d'})
        self.assertIsNotNone(buyer.uri)
        self.assertTrue(buyer.uri.startswith(mp.uri + '/accounts'))

    def _find_account(self, role, owner=False, all_accounts=False):
        mp = self._find_marketplace()
        accounts = list(mp.accounts)
        if all_accounts:
            return accounts
        accounts = [account for account in accounts if role in account.roles]
        if not owner:
            for account in accounts:
                if account.email_address == 'support@example.com':
                    continue
                if 'merchant' in account.roles and role == 'buyer':
                    continue
                break
            accounts = [account]

        return accounts[0]

    def test_05_index_accounts(self):
        accounts = self._find_account(None, all_accounts=True)
        self.assertEqual(len(accounts), 2)
        account = self._find_account('buyer')
        self.assertEqual(account.name, 'khalkhalash onastick')
        self.assertEqual(account.roles, ['buyer'])
        self.assertIsNotNone(account.created_at)
        self.assertDictEqual(account.meta, {'test#': 'test_d'})
        self.assertIsNotNone(account.uri)

    def test_06_debit_buyer_account_and_refund(self):
        account = self._find_account('buyer')
        debit = account.debit(
            amount=1000,
            appears_on_statement_as='atest',
            meta={'fraud': 'yes'},
            description='Descripty')
        self.assertTrue(debit.id.startswith('W'))
        self.assertIsInstance(debit.account, balanced.Account)
        self.assertIsInstance(debit.hold, balanced.Hold)
        self.assertEqual(debit.description, 'Descripty')
        self.assertIsNone(debit.fee)
        self.assertEqual(debit.appears_on_statement_as, 'atest')

        refund = debit.refund(amount=100)
        self.assertTrue(refund.id.startswith('RF'))
        self.assertEqual(refund.debit.uri, debit.uri)
        self.assertIsNone(refund.fee)

        another_debit = account.debit(
            amount=1000,
            meta={'fraud': 'yes'})
        self.assertEqual(another_debit.appears_on_statement_as, 'example.com')

        another_debit.refund()

    def test_07_create_hold_and_void_it(self):
        account = self._find_account('buyer')
        hold = account.hold(amount=1500, description='Hold me')
        self.assertIsNone(hold.fee)
        self.assertEqual(hold.account.uri, account.uri)
        self.assertFalse(hold.is_void)
        self.assertEqual(hold.description, 'Hold me')
        hold.void()
        self.assertTrue(hold.is_void)
        self.assertIsNone(hold.fee)

    def test_08_create_hold_and_debit_it(self):
        account = self._find_account('buyer')
        hold = account.hold(amount=1500)
        self.assertTrue(hold.id.startswith('HL'))
        debit = hold.capture()
        self.assertIsNone(debit.fee)

    def test_09_create_a_person_merchant(self):
        mp = self._find_marketplace()
        merchant = mp.create_merchant('mahmoud@poundpay.com',
            merchant=PERSON_MERCHANT)
        self.assertEqual(merchant.roles, ['merchant'])

    def test_10_create_a_business_merchant(self):
        mp = self._create_marketplace()
        payload = {
            "name": "Levain Bakery LLC",
            "account_number": "28304871049",
            "bank_code": "121042882",
            }
        bank_account = balanced.BankAccount(**payload).save()
        merchant = mp.create_merchant(
            'mahmoud+khalkhalash@poundpay.com',
            merchant=BUSINESS_MERCHANT,
            bank_account_uri=bank_account.uri,
        )
        self.assertItemsEqual(merchant.roles, ['merchant'])

    def test_11_create_a_business_merchant_with_existing_email_addr(self):
        mp = self._find_marketplace()
        with self.assertRaises(requests.HTTPError) as exc:
            mp.create_merchant('mahmoud@poundpay.com',
                merchant=PERSON_MERCHANT)
        the_exception = exc.exception
        self.assertEqual(the_exception.status_code, 409)
        self.assertIn(
            'Account with email address "mahmoud@poundpay.com" already exists',
            the_exception.description)

    def test_12_get_business_merchant_for_crediting(self):
        buyer = self._find_account('buyer')
        buyer.debit(amount=10000)
        self.merchant = self.merchant.find(self.merchant.uri)
        marketplace = self.merchant.marketplace
        original_balance = marketplace.in_escrow
        merchants = list(marketplace.accounts.filter(
            email_address='mahmoud+khalkhalash@poundpay.com'
            ))
        merchant = merchants[0]
        credit = merchant.credit(amount=1000)
        self.assertTrue(credit.id.startswith('CR'))
        self.assertEqual(credit.amount, 1000)
        marketplace = marketplace.find(marketplace.uri)
        self.assertEqual(
            marketplace.in_escrow,
            original_balance - credit.amount)

    def test_13_credit_more_than_the_escrow_balance_should_fail(self):
        buyer = self._find_account('buyer')
        buyer.debit(amount=10000)
        self.merchant = self.merchant.find(self.merchant.uri)
        marketplace = self.merchant.marketplace
        original_balance = marketplace.in_escrow
        merchant = self._find_account('merchant')
        with self.assertRaises(requests.HTTPError) as exc:
            merchant.credit(amount=original_balance + 1000)
        the_exception = exc.exception
        self.assertEqual(the_exception.status_code, 409)
        print(the_exception)

    def test_15_debits_without_an_account(self):
        with self.assertRaises(requests.HTTPError) as exc:
            balanced.Debit().save()
        the_exception = exc.exception
        self.assertEqual(the_exception.status_code, 400)
        print(the_exception)

    def test_16_slice_syntax(self):
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
            self.assertEqual(debit.uri,
                             balanced.Debit.query[last + index].uri)

    def test_17_test_merchant_cache_busting(self):
        # cache it.
        a_merchant = self.merchant.me
        a_merchant.bank_account = {
            'account_number': '112233a',
            'name': 'hald',
            'bank_code': '121042882',
            }
        self.assertTrue(hasattr(self.merchant.me, 'bank_account'))
        a_merchant.save()
        self.assertFalse(hasattr(a_merchant, 'bank_account'))

    def test_18_create_and_associate_card(self):
        try:
            mp = balanced.Marketplace.query.one()
        except NoResultFound:
            mp = balanced.Marketplace().save()
        card = mp.create_card(**CARD)
        self.assertTrue(card.id.startswith('CC'))
        account = mp.create_merchant('randy@pandy.com',
            merchant=PERSON_MERCHANT)
        account.add_card(card.uri)

    def test_19_create_and_associate_bank_account(self):
        try:
            mp = balanced.Marketplace.query.one()
        except NoResultFound:
            mp = balanced.Marketplace().save()
        bank_account = mp.create_bank_account(**BANK_ACCOUNT)
        self.assertTrue(bank_account.id.startswith('BA'))
        account = mp.create_merchant('free@example.com',
            merchant=PERSON_MERCHANT)
        account.add_bank_account(bank_account.uri)

    def test_20_test_filter_and_sort(self):
        try:
            self._find_marketplace()
        except balanced.exc.NoResultFound:
            balanced.Marketplace().save()

        buyer = self._find_account('buyer')
        deb1 = buyer.debit(amount=1122, meta={'tag': '1'})
        deb2 = buyer.debit(amount=3322, meta={'tag': '1'})
        deb3 = buyer.debit(amount=2211, meta={'tag': '2'})

        debs = (balanced.Debit.query
            .filter(balanced.Debit.f.meta.tag == '1')
            .all())
        self.assertItemsEqual([deb.id for deb in debs], [deb1.id, deb2.id])

        debs = (balanced.Debit.query
            .filter(balanced.Debit.f.meta.tag == '2')
            .all())
        self.assertItemsEqual([deb.id for deb in debs], [deb3.id])

        debs = (balanced.Debit.query
            .filter(balanced.Debit.f.meta.contains('tag'))
            .sort(balanced.Debit.f.amount.asc())
            .all())
        self.assertEqual(len(debs), 3)
        self.assertEqual([deb.id for deb in debs], [deb1.id, deb3.id, deb2.id])

        debs = (balanced.Debit.query
            .filter(balanced.Debit.f.meta.contains('tag'))
            .sort(balanced.Debit.f.amount.desc())
            .all())
        self.assertEqual(len(debs), 3)
        self.assertEqual([deb.id for deb in debs], [deb2.id, deb3.id, deb1.id])

    def test_21_mask_bank_account(self):
        mp = self._create_marketplace()
        payload = BANK_ACCOUNT.copy()
        payload['account_number'] = '1212121-110-019'
        bank_account = mp.create_bank_account(**payload)
        self.assertEqual(bank_account.last_four, '0019')

    def test_22_create_international_card(self):
        mp = self._create_marketplace()
        card = mp.create_card(**INTERNATIONAL_CARD)
        self.assertTrue(card.id.startswith('CC'))
        self.assertEqual(card.street_address,
            INTERNATIONAL_CARD['street_address'])

    def test_23_kyc_redirect(self):
        mp = self._create_marketplace()

        redirect_pattern = ('https://www.balancedpayments.com'
            '/marketplaces/(.*)/kyc')

        with self.assertRaises(MoreInformationRequiredError) as ex:
            mp.create_merchant('marshall@poundpay.com', PERSON_FAILING_KYC)

        redirect_uri = ex.exception.redirect_uri
        result = re.search(redirect_pattern, redirect_uri)
        self.assertTrue(result)

    def test_24_toplevel_bank_account(self):
        self._create_marketplace()
        count = balanced.BankAccount.query.count()
        payload = BANK_ACCOUNT_W_TYPE.copy()
        bank_account = balanced.BankAccount(**payload).save()
        self.assertFalse(hasattr(bank_account, 'last_four'))
        self.assertFalse(hasattr(bank_account, 'bank_code'))
        self.assertTrue(hasattr(bank_account, 'routing_number'))
        self.assertEqual(bank_account.routing_number,
                         payload['routing_number'])
        self.assertEqual(payload['account_number'][-4:],
                         bank_account.account_number[-4:])
        self.assertIsNotNone(bank_account.credits_uri)
        self.assertEqual(balanced.BankAccount.query.count(), count + 1)

    def test_25_index_toplevel_bank_accounts(self):
        self._create_marketplace()
        count = balanced.BankAccount.query.count()
        bas = balanced.BankAccount.query.all()
        self.assertEqual(len(bas), count)
        self.assertGreater(count, 0)

    def test_26_toplevel_bank_account_credit(self):
        self._create_marketplace()
        buyer = self._find_account('buyer')
        card = balanced.Marketplace.my_marketplace.create_card(**CARD)
        buyer.add_card(card.uri)
        buyer.debit(1212121)

        payload = BANK_ACCOUNT_W_TYPE.copy()
        bank_account = balanced.BankAccount(**payload).save()
        cr = bank_account.credit(50)
        self.assertEqual(cr.amount, 50)

    def test_27_toplevel_credit(self):
        self._create_marketplace()
        buyer = self._find_account('buyer')
        card = balanced.Marketplace.my_marketplace.create_card(**CARD)
        buyer.add_card(card.uri)
        buyer.debit(1212121)

        payload = CREDIT.copy()
        payload['bank_account'] = BANK_ACCOUNT_W_TYPE.copy()
        credit = balanced.Credit(**payload).save()
        self.assertEqual(credit.amount, payload['amount'])
        self.assertEqual(credit.description, payload['description'])
        self.assertNotIn('id', credit.bank_account)
        self.assertNotIn('uri', credit.bank_account)
        self.assertNotIn('created_at', credit.bank_account)

    def test_28_on_behalf_of(self):
        mp = self._create_marketplace()
        buyer = self._find_account('buyer')
        merchant = mp.create_merchant('mahmoud2@poundpay.com',
                                      merchant=PERSON_MERCHANT)

        card = balanced.Marketplace.my_marketplace.create_card(**CARD)
        buyer.add_card(card.uri)

        self.assertIsNotNone(buyer.debit(2222, on_behalf_of=merchant.uri))

        with warnings.catch_warnings(record=True) as w:
            self.assertIsNotNone(buyer.debit(1111, merchant_uri=merchant.uri))
            self.assertEqual(len(w), 1)

        # test that we extract the uri if you pass the object
        with mock.patch('balanced.resources.Debit') as debit:
            buyer.debit(2222, on_behalf_of=merchant)
            self.assertEqual(
                debit.call_args[1]['on_behalf_of_uri'],
            merchant.uri)

        # test that we throw an exception if the uri of the merchant is the
        # same as the account uri
        with self.assertRaises(ValueError) as exc:
            buyer.debit(2222, on_behalf_of=buyer)
            self.assertEqual(
                exc.exception.args[0],
                'The on_behalf_of parameter MAY NOT be the same account as '
                'the account you are debiting!'
            )

        # test that you can't pass in a bunch of shit
        with self.assertRaises(ValueError) as exc:
            buyer.debit(2222, on_behalf_of=15)
            self.assertEqual(
                exc.exception.args[0],
                'The on_behalf_of parameter needs to be an account uri'
            )
