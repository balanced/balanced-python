# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import inspect
import time

import unittest

import balanced


class AcceptanceUseCases(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        balanced.config.root_uri = 'http://127.0.0.1:5000/'
        if not balanced.config.api_key_secret:
            api_key = balanced.APIKey().save()
            balanced.configure(api_key.secret)
            cls.api_key = api_key
            cls.merchant = api_key.merchant
            balanced.Marketplace().save()

    def test_00_merchant_expectations(self):
        mps = balanced.Marketplace.query.all()
        self.assertEqual(len(mps), 1)


CARD = {
    'street_address': '801 High Street',
    'city': 'Palo Alto',
    'region': 'CA',
    'postal_code': '94301',
    'name': 'Johnny Fresh',
    'card_number': '4' + '1' * 15,
    'expiration_month': 12,
    'expiration_year': 2013,
    }

CARD_NO_ADDRESS = {
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


class AICases(AcceptanceUseCases):

    email_address_counter = 0

    def setUp(self):
        try:
            self.mp = balanced.Marketplace.my_marketplace
        except:
            self.mp = balanced.Marketplace().save()

    def _email_address(self):
        self.email_address_counter += 1
        return 'suite+{}+{}@example.com'.format(
            time.time(), self.email_address_counter)

    def _test_transaction_successes(self, cases):
        for callable, kwargs, validate_cls, validate_kwargs in cases:
            if inspect.isclass(callable):
                resource = callable(**kwargs).save()
            else:
                resource = callable(**kwargs)
            self.assertTrue(isinstance(resource, validate_cls))
            for k, v in validate_kwargs.iteritems():
                self.assertEqual(getattr(resource, k), v)

    def _test_transaction_failures(self, cases):
        for callable, kwargs, exc, validate_kwargs in cases:
            with self.assertRaises(exc) as ex_ctx:
                if inspect.isclass(callable):
                    callable(**kwargs).save()
                else:
                    callable(**kwargs)
            for k, v in validate_kwargs.iteritems():
                self.assertEqual(getattr(ex_ctx, k), v)

    def test_hold_successes(self):
        cases = [
            ]
        self._test_transaction_successes(cases)

    def test_hold_failures(self):
        cases = [
            ]
        self._test_transaction_failures(cases)

    def test_refund_successes(self):
        cases = [
            ]
        self._test_transaction_successes(cases)

    def test_refund_failures(self):
        cases = [
            ]
        self._test_transaction_failures(cases)

    def test_credit_successes(self):
        cases = [
            ]
        self._test_transaction_successes(cases)

    def test_credit_failures(self):
        cases = [
            ]
        self._test_transaction_failures(cases)

    def test_debits_success(self):
        cases = [
            ]
        self._test_transaction_successes(cases)

    def test_debits_failures(self):
        cases = [
            ]
        self._test_transaction_failures(cases)

    def test_hold_card_uri(self):
        cases = []
        self._test_transaction_successes(cases)

    def test_debit_card_uri(self):
        cases = []
        self._test_transaction_successes(cases)

    def test_upgrade_account_to_merchant_invalid_uri(self):
        card = self.mp.create_card(**CARD)
        buyer = self.mp.create_buyer('a@b.com', card.uri)
        buyer.merchant_uri = '/no/a/merchant'
        with self.assertRaises(balanced.exc.HTTPError) as ex_ctx:
            buyer.save()
        ex = ex_ctx.exception
        self.assertEqual(ex.status_code, 400)
        self.assertIn(
            'Invalid field "merchant_uri" - v1/no/a/merchant not found',
            str(ex))

    def test_upgrade_account_to_merchant_success(self):
        card = self.mp.create_card(**CARD)
        with balanced.key_switcher(None):
            api_key = balanced.APIKey().save()
        merchant = api_key.merchant
        buyer = self.mp.create_buyer(self._email_address(), card.uri)
        self.assertItemsEqual(buyer.roles, ['buyer'])
        buyer.merchant_uri = merchant.uri
        buyer.save()
        self.assertItemsEqual(buyer.roles, ['buyer', 'merchant'])

    def test_debit_uses_newly_added_funding_src(self):
        bank_account = balanced.BankAccount(**BANK_ACCOUNT).save()
        merchant_account = self.mp.create_merchant(
            self._email_address(),
            merchant=BUSINESS_MERCHANT,
            bank_account_uri=bank_account.uri,
            )

        # debit bank account
        debit = merchant_account.debit(amount=100)
        self.assertEqual(debit.source.id, bank_account.id)

        # debit card
        card = balanced.Card(**CARD).save()
        merchant_account.add_card(card.uri)
        debit = merchant_account.debit(amount=100)
        self.assertEqual(debit.source.id, card.id)

        # debit bank account
        card.is_valid = False
        card.save()
        debit = merchant_account.debit(amount=100)
        self.assertEqual(debit.source.id, bank_account.id)

    def test_maximum_credit_amount(self):
        bank_account = balanced.BankAccount(**BANK_ACCOUNT).save()
        merchant_account = self.mp.create_merchant(
            self._email_address(),
            merchant=BUSINESS_MERCHANT,
            bank_account_uri=bank_account.uri,
            )
        balanced.bust_cache()
        self.mp = balanced.Marketplace.my_marketplace
        if self.mp.in_escrow:
            merchant_account.credit(self.mp.in_escrow)
        with self.assertRaises(balanced.exc.HTTPError) as ex_ctx:
            merchant_account.credit(100)
        ex = ex_ctx.exception
        self.assertIn('has insufficient funds to cover a transfer of', str(ex))
        card = self.mp.create_card(**CARD)
        buyer = self.mp.create_buyer(self._email_address(), card.uri)
        buyer.debit(200)
        merchant_account.credit(100)

    def test_maximum_debit_amount(self):
        card = self.mp.create_card(**CARD)
        buyer = self.mp.create_buyer(self._email_address(), card.uri)
        with self.assertRaises(balanced.exc.HTTPError) as ex_ctx:
            buyer.debit(10 ** 9 + 1)
        ex = ex_ctx.exception
        self.assertIn('must be <= 1000000000', str(ex))

    def test_maximum_refund_amount(self):
        bank_account = balanced.BankAccount(**BANK_ACCOUNT).save()
        merchant = self.mp.create_merchant(
            self._email_address(),
            merchant=BUSINESS_MERCHANT,
            bank_account_uri=bank_account.uri,
            )
        balanced.bust_cache()
        self.mp = balanced.Marketplace.my_marketplace
        if self.mp.in_escrow:
            merchant.credit(self.mp.in_escrow)
        card = self.mp.create_card(**CARD)
        buyer = self.mp.create_buyer(self._email_address(), card.uri)
        debit = buyer.debit(200)
        bank_account = balanced.BankAccount(**BANK_ACCOUNT).save()
        merchant.credit(100)
        with self.assertRaises(balanced.exc.HTTPError) as ex_ctx:
            debit.refund()
        ex = ex_ctx.exception
        self.assertIn('balance insufficient to issue refund', str(ex))
        ex = ex_ctx.exception
        buyer.debit(100)
        debit.refund()

    def test_view_credits_once_bank_account_has_been_invalidated(self):
        bank_account = balanced.BankAccount(**BANK_ACCOUNT).save()
        merchant = self.mp.create_merchant(
            self._email_address(),
            merchant=BUSINESS_MERCHANT,
            bank_account_uri=bank_account.uri,
            )
        card = self.mp.create_card(**CARD)
        buyer = self.mp.create_buyer(self._email_address(), card.uri)
        buyer.debit(100 + 200 + 300)
        credit1 = merchant.credit(100)
        credit2 = merchant.credit(200)
        credit3 = merchant.credit(300)
        merchant.bank_accounts[0].invalid = True
        merchant.bank_accounts[0].save()
        self.assertItemsEqual(
            [credit1.id, credit2.id, credit3.id],
            [c.id for c in merchant.credits]
            )

    def test_create_merchants_with_same_identity_on_same_marketplace(self):
        with balanced.key_switcher(None):
            api_key = balanced.APIKey().save()
        merchant = api_key.merchant
        merch_account_1 = self.mp.create_merchant(
            self._email_address(),
            merchant_uri=merchant.uri)
        merch_account_2 = self.mp.create_merchant(
            self._email_address(),
            merchant_uri=merchant.uri)
        self.assertEqual(merch_account_1.roles, ['merchant'])
        self.assertEqual(merch_account_2.roles, ['merchant'])

    def test_tokenize_card_without_address(self):
        card = balanced.Card(**CARD_NO_ADDRESS).save()
