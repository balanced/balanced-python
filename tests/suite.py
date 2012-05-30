from __future__ import unicode_literals

import unittest

import requests

import balanced
from balanced.exc import NoResultFound


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
    'tax_id': '393483992',
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
    'card_number': '4' + '1' * 15,
    'expiration_month': 12,
    'expiration_year': 2013,
    }

BANK_ACCOUNT = {
    'name': 'Homer Jay',
    'account_number': '112233a',
    'bank_code': '121042882',
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
            meta={'fraud': 'yes'})
        self.assertTrue(debit.id.startswith('W'))
        self.assertIsInstance(debit.account, balanced.Account)
        self.assertIsInstance(debit.hold, balanced.Hold)
        self.assertEqual(debit.fee, (1000 * 0.035))
        self.assertEqual(debit.appears_on_statement_as, 'atest')
        self.assertIsNone(debit.description)

        refund = debit.refund(amount=100)
        #self.assertTrue(refund.id.startswith('RF'))
        self.assertEqual(refund.debit.uri, debit.uri)
        self.assertEqual(refund.fee, -1 * int((100 * 0.035)))

        another_debit = account.debit(
            amount=1000,
            meta={'fraud': 'yes'})
        self.assertEqual(another_debit.appears_on_statement_as, 'example.com')

        another_refund = another_debit.refund()
        self.assertEqual(another_refund.fee + another_debit.fee, 0)

    def test_07_create_hold_and_void_it(self):
        account = self._find_account('buyer')
        hold = account.hold(amount=1500)
        self.assertEqual(hold.fee, 35)
        self.assertEqual(hold.account.uri, account.uri)
        self.assertFalse(hold.is_void)
        hold.void()
        self.assertTrue(hold.is_void)
        self.assertEqual(hold.fee, 35)  # fee still the same

    def test_08_create_hold_and_debit_it(self):
        account = self._find_account('buyer')
        hold = account.hold(amount=1500)
        self.assertTrue(hold.id.startswith('HL'))
        debit = hold.capture()
        self.assertEqual(debit.fee, int((1500 * 0.035)))

    def test_09_create_a_person_merchant(self):
        mp = self._find_marketplace()
        merchant = mp.create_merchant('mahmoud@poundpay.com',
            merchant=PERSON_MERCHANT)
        self.assertEqual(merchant.roles, ['merchant'])

    def test_10_create_a_business_merchant(self):
        mp = self._find_marketplace()
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
        self.assertItemsEqual(merchant.roles, ['buyer', 'merchant'])

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
        print the_exception

    def test_14_appends_marketplace_for_creating_account(self):
        with self.assertRaises(requests.HTTPError) as exc:
            balanced.Account().save()
        the_exception = exc.exception
        self.assertEqual(the_exception.status_code, 400)
        print the_exception

    def test_15_debits_without_an_account(self):
        with self.assertRaises(requests.HTTPError) as exc:
            balanced.Debit().save()
        the_exception = exc.exception
        self.assertEqual(the_exception.status_code, 400)
        print the_exception

    def test_16_slice_syntax(self):
        total_debit = balanced.Debit.query.count()
        self.assertNotEqual(total_debit, 2)
        sliced_debits = balanced.Debit.query[:2]
        self.assertEqual(len(sliced_debits), 2)
        for debit in sliced_debits:
            self.assertIsInstance(debit, balanced.Debit)

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
        try:
            mp = balanced.Marketplace.query.one()
        except NoResultFound:
            mp = balanced.Marketplace().save()
        payload = BANK_ACCOUNT.copy()
        payload['account_number'] = '1212121-110-019'
        bank_account = mp.create_bank_account(**payload)
        self.assertEqual(bank_account.last_four, '0019')
