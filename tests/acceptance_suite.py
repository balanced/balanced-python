# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import balanced
import requests
import unittest

from fixtures import cards, merchants


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

    def setUp(self):
        self.valid_international_address = {
            'street_address': '24 Grosvenor Square London, Mayfair, London',
            'country_code': 'GBR',
        }
        self.person = {
            'name': 'James Bond',
        }
        self.valid_us_address = {
            'street_address': '1 Large Prime St',
            'city': 'Gaussian',
            'state': 'CA',
            'postal_code': '99971',
        }
        self.us_card_payload = {
            'name': 'Richard Feynman',
            'card_number': cards.TEST_CARDS['visa'][0],
            'expiration_month': 12,
            'expiration_year': 2013,
        }
        self.us_card_payload.update(self.valid_us_address)

        self.bank_account_payload = {
            'name': 'Galileo Galilei',
            'account_number': '28304871049',
            'bank_code': '121042882',
         }

    def _find_buyer_account(self):
        mp = balanced.Marketplace.query.one()
        accounts = list(mp.accounts)
        filtered_accounts = [account for account in accounts if account.roles == ['buyer']]
        if not filtered_accounts:
            card_payload = dict(self.us_card_payload)
            card = balanced.Card(**card_payload).save()
            card_uri = card.uri
            buyer = mp.create_buyer(
                email_address='albert@einstein.com',
                card_uri=card_uri,
                meta={'foo': 'bar'},
            )
        else:
            buyer = filtered_accounts[0]
        return buyer

    def test_merchant_expectations(self):
        mps = balanced.Marketplace.query.all()
        self.assertEqual(len(mps), 1)

    @unittest.skip('need balanced fix')
    def test_valid_non_us_address_no_postal_code(self):
        card_number = cards.TEST_CARDS['visa'][0]
        card_payload = {
            'card_number': card_number,
            'expiration_month': 12,
            'expiration_year': 2013,
        }
        card_payload.update(self.valid_international_address)
        card_payload.update(self.person)
        balanced.Card(**card_payload).save()

    def test_valid_us_address(self):
        buyer = self._find_buyer_account()
        self.assertTrue(buyer.id.startswith('AC'), buyer.id)
        self.assertEqual(buyer.roles, ['buyer'])
        self.assertDictEqual(buyer.meta, {'foo': 'bar'})

    def test_fractional_debit(self):
        buyer_account = self._find_buyer_account()
        bad_amount = (3.14, 100.32)
        for amount in bad_amount:
            with self.assertRaises(requests.HTTPError) as exc:
                buyer_account.debit(
                    amount=amount,
                    appears_on_statement_as='pi',
                )
            the_exception = exc.exception
            self.assertEqual(the_exception.status_code, 400)

    def test_create_simple_credit(self):
        mp = balanced.Marketplace.query.one()
        payload = dict(self.bank_account_payload)
        bank_account = balanced.BankAccount(**payload).save()
        merchant = mp.create_merchant(
            'cvraman@spectroscopy.com',
            merchant=merchants.BUSINESS_MERCHANT,
            bank_account_uri=bank_account.uri,
        )
        self.assertItemsEqual(merchant.roles, ['buyer', 'merchant'])

        amount = 10000
        buyer_account = self._find_buyer_account()
        buyer_account.debit(amount=amount)
        merchant.credit(amount)

    def test_credit_lower_than_escrow(self):
        mp = balanced.Marketplace.query.one()
        escrow_balance = mp.in_escrow 
        credit_amount = escrow_balance + 10000
        merchants = mp.accounts
        merchant = merchants[0]
        with self.assertRaises(requests.HTTPError) as exc:
            merchant.credit(amount=credit_amount)
        the_exception = exc.exception
        self.assertEqual(the_exception.status_code, 409)

    def test_valid_international_address(self):
        for card_payload in cards.generate_international_cards():
            card = balanced.Card(**card_payload).save()
            self.assertEqual(card.street_address,
                card_payload['street_address'])
