# -*- coding: utf-8 -*-

import inspect
import time

import balanced
import copy
import requests
import unittest

from .fixtures import cards, merchants, bank_accounts


class TestCases(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        balanced.config.root_uri = 'http://127.0.0.1:5000/'
        if not balanced.config.api_key_secret:
            api_key = balanced.APIKey().save()
            balanced.configure(api_key.secret)
            cls.api_key = api_key
            cls.merchant = api_key.merchant
            balanced.Marketplace().save()


class AcceptanceUseCases(TestCases):

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

    def test_00_merchant_expectations(self):
        mps = balanced.Marketplace.query.all()
        self.assertEqual(len(mps), 1)

    def _create_buyer_account(self):
        mp = balanced.Marketplace.query.one()
        card_payload = dict(self.us_card_payload)
        card = balanced.Card(**card_payload).save()
        card_uri = card.uri
        buyer = mp.create_buyer(
            email_address='albert@einstein.com',
            card_uri=card_uri,
            meta={'foo': 'bar'},
        )
        return buyer

    def _find_buyer_account(self):
        mp = balanced.Marketplace.query.one()
        accounts = list(mp.accounts)
        filtered_accounts = [
            account for account in accounts if account.roles == ['buyer']
        ]
        if not filtered_accounts:
            buyer = self._create_buyer_account()
        else:
            for account in filtered_accounts:
                # this account will fail any debit, so don't use it
                if account.email_address == 'stephen@hawking.com':
                    continue
                buyer = account
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
        buyer = self._create_buyer_account()
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
        self.assertItemsEqual(merchant.roles, ['merchant'])

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
        for card_payload in cards.generate_international_card_payloads():
            card = balanced.Card(**card_payload).save()
            self.assertEqual(card.street_address,
                             card_payload['street_address'])

    def test_bad_card(self):
        mp = balanced.Marketplace.query.one()
        card_payload = dict(self.us_card_payload)
        card_payload['card_number'] = cards.AUTH_INVALID_CARD
        bad_card = balanced.Card(**card_payload).save()
        bad_card_uri = bad_card.uri
        buyer = mp.create_buyer(
            email_address='stephen@hawking.com',
            card_uri=bad_card_uri,
            meta={'foo': 'bar'},
        )
        with self.assertRaises(requests.HTTPError) as exc:
            buyer.debit(777)
        the_exception = exc.exception
        self.assertEqual(the_exception.status_code, 402)
        self.assertEqual(the_exception.category_code, 'card-declined')

    def test_transactions_using_second_card(self):
        mp = balanced.Marketplace.query.one()
        card_payload = dict(self.us_card_payload)
        old_card = balanced.Card(**card_payload).save()
        old_card_uri = old_card.uri
        buyer = mp.create_buyer(
            email_address='inspector@lestrade.com',
            card_uri=old_card_uri,
            meta={'foo': 'bar'},
        )

        card_payload = dict(self.us_card_payload)
        new_card = balanced.Card(**card_payload).save()
        new_card_uri = new_card.uri
        buyer.add_card(card_uri=new_card_uri)

        # Test default card
        debit = buyer.debit(777)
        self.assertEqual(debit.source.id, new_card.id)

        # Test explicit card
        debit = buyer.debit(777, source_uri=new_card_uri)
        self.assertEqual(debit.source.id, new_card.id)

    def test_associate_bad_cards(self):
        mp = balanced.Marketplace.query.one()
        card_payload = dict(self.us_card_payload)
        card = balanced.Card(**card_payload).save()
        card_uri = card.uri
        buyer = mp.create_buyer(
            email_address='james@watson.com',
            card_uri=card_uri,
            meta={'foo': 'bar'},
        )
        # Invalid card
        card_payload = dict(self.us_card_payload)
        card_payload['is_valid'] = False
        card = balanced.Card(**card_payload).save()
        card_uri = card.uri
        with self.assertRaises(requests.HTTPError) as exc:
            buyer.add_card(card_uri=card_uri)
        the_exception = exc.exception
        self.assertEqual(the_exception.status_code, 409)
        self.assertEqual(the_exception.category_code,
                         'card-not-valid')

        # Already-associated card
        card_payload = dict(self.us_card_payload)
        card = balanced.Card(**card_payload).save()
        card_uri = card.uri
        mp.create_buyer(
            email_address='james@moriarty.com',
            card_uri=card_uri,
            meta={'foo': 'bar'},
        )
        with self.assertRaises(requests.HTTPError) as exc:
            buyer.add_card(card_uri=card_uri)
        the_exception = exc.exception
        self.assertEqual(the_exception.status_code, 409)
        self.assertEqual(the_exception.category_code,
                         'card-already-funding-src')

        # Completely fake card uri
        with self.assertRaises(requests.HTTPError) as exc:
            buyer.add_card(card_uri='/completely/fake')
        the_exception = exc.exception
        self.assertEqual(the_exception.status_code, 400)

    def test_transactions_invalid_funding_sources(self):
        mp = balanced.Marketplace.query.one()
        card_payload = dict(self.us_card_payload)
        card = balanced.Card(**card_payload).save()
        card_uri = card.uri
        buyer = mp.create_buyer(
            email_address='sherlock@holmes.com',
            card_uri=card_uri,
            meta={'foo': 'bar'},
        )
        # invalidate card
        card.is_valid = False
        card.save()

        # Now use the card
        with self.assertRaises(requests.HTTPError) as exc:
            # ...implicitly
            buyer.debit(6000)
        the_exception = exc.exception
        self.assertEqual(the_exception.status_code, 409)
        self.assertEqual(the_exception.category_code,
                         'no-funding-source')

        with self.assertRaises(requests.HTTPError) as exc:
            # ... and explicitly
            buyer.debit(7000, source_uri=card.uri)
        the_exception = exc.exception
        self.assertEqual(the_exception.status_code, 409)
        self.assertEqual(the_exception.category_code,
                         'card-not-valid')

        with self.assertRaises(requests.HTTPError) as exc:
            buyer.credit(8000)
        the_exception = exc.exception
        self.assertEqual(the_exception.status_code, 409)
        self.assertEqual(the_exception.category_code,
                         'no-funding-destination')

    def test_merchant_no_bank_account(self):
        mp = balanced.Marketplace.query.one()
        merchant_payload = copy.deepcopy(merchants.BUSINESS_MERCHANT)
        merchant_payload['tax_id'] = '123456789'

        merchant = mp.create_merchant(
            'pauli@exclusion.com',
            merchant=merchant_payload,
        )
        # now try to credit
        amount = 10000
        buyer_account = self._find_buyer_account()
        buyer_account.debit(amount=amount)
        with self.assertRaises(requests.HTTPError) as exc:
            merchant.credit(amount)
        the_exception = exc.exception
        self.assertEqual(the_exception.status_code, 409)

        # try to debit
        with self.assertRaises(requests.HTTPError) as exc:
            merchant.debit(600)
        the_exception = exc.exception
        self.assertEqual(the_exception.status_code, 409)

        # add a card, make sure we can use it
        card_payload = dict(self.us_card_payload)
        card = balanced.Card(**card_payload).save()
        card_uri = card.uri
        merchant.add_card(card_uri=card_uri)

        # try to debit again
        debit = merchant.debit(601)
        self.assertEqual(debit.source.id, card.id)

    def test_add_funding_destination_to_nonmerchant(self):
        mp = balanced.Marketplace.query.one()
        card_payload = dict(self.us_card_payload)
        card = balanced.Card(**card_payload).save()
        card_uri = card.uri
        buyer = mp.create_buyer(
            email_address='irene@adler.com',
            card_uri=card_uri,
            meta={'foo': 'bar'},
        )
        # Debit money from this buyer to ensure the marketplace has enough to
        # credit her later
        buyer.debit(2 * 700)
        bank_account_payload = dict(self.bank_account_payload)
        bank_account = balanced.BankAccount(**bank_account_payload).save()
        bank_account_uri = bank_account.uri
        buyer.add_bank_account(bank_account_uri=bank_account_uri)

        # Implicit
        credit = buyer.credit(700)
        self.assertEqual(credit.destination.id, bank_account.id)
        # Explicit
        credit = buyer.credit(700, destination_uri=bank_account_uri)
        self.assertEqual(credit.destination.id, bank_account.id)

    def test_update_stupid_values(self):
        mp = balanced.Marketplace.query.one()
        card_payload = dict(self.us_card_payload)
        card = balanced.Card(**card_payload).save()
        card_uri = card.uri
        buyer = mp.create_buyer(
            email_address='inspector@gregson.com',
            card_uri=card_uri,
            meta={'foo': 'bar'},
        )
        # Add a bank account to test crediting
        bank_account_payload = dict(self.bank_account_payload)
        bank_account = balanced.BankAccount(**bank_account_payload).save()
        bank_account_uri = bank_account.uri
        buyer.add_bank_account(bank_account_uri=bank_account_uri)

        name = buyer.name
        buyer.name = 's' * 1000
        with self.assertRaises(requests.HTTPError) as exc:
            buyer.save()
        the_exception = exc.exception
        self.assertIn('must have length <=', the_exception.description)
        buyer.name = name

        with self.assertRaises(requests.HTTPError) as exc:
            buyer.debit(100 ** 100)
        the_exception = exc.exception
        self.assertEqual(the_exception.status_code, 400)
        self.assertIn('must be <=', the_exception.description)

        with self.assertRaises(requests.HTTPError) as exc:
            buyer.credit(100 ** 100)
        the_exception = exc.exception
        self.assertEqual(the_exception.status_code, 400)
        self.assertIn('must be <=', the_exception.description)

    def test_zzz_remove_owner_merchant_account_bank_account(self):
        mp = balanced.Marketplace.query.one()
        owner = mp.owner_account
        ba = owner.bank_accounts[0]
        ba.is_valid = False
        ba.save()

        with self.assertRaises(requests.HTTPError) as exc:
            owner.debit(600)
        the_exception = exc.exception
        self.assertEqual(the_exception.status_code, 409)
        self.assertEqual('no-funding-source',
                         the_exception.category_code)

        with self.assertRaises(requests.HTTPError) as exc:
            owner.credit(900)
        the_exception = exc.exception
        self.assertEqual(the_exception.status_code, 409)
        self.assertEqual('no-funding-destination',
                         the_exception.category_code)

    def test_redirect_on_merchant_failure(self):

        mp = balanced.Marketplace.query.one()
        merchant = copy.deepcopy(merchants.PERSON_MERCHANT)
        merchant['region'] = 'EX'
        merchant['postal_code'] = '99999'
        with self.assertRaises(requests.HTTPError) as ex:
            merchant = mp.create_merchant('testing@redirect.com',
                                          merchant=merchant)
        the_exception = ex.exception
        self.assertEqual(the_exception.status_code, 300)


class AICases(TestCases):

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
        results = []
        for callable, kwargs, validate_cls, validate_kwargs in cases:
            if inspect.isclass(callable):
                resource = callable(**kwargs).save()
            else:
                resource = callable(**kwargs)
            if validate_cls is not None:
                self.assertTrue(isinstance(resource, validate_cls))
                for k, v in validate_kwargs.items():
                    resource_v = getattr(resource, k)
                    if isinstance(v, balanced.Resource):
                        self.assertEqual(v.id, resource_v.id)
                    else:
                        self.assertEqual(v, resource_v)
            results.append(resource)
        return results

    def _test_transaction_failures(self, cases):
        for callable, kwargs, exc, message in cases:
            with self.assertRaises(exc) as ex_ctx:
                if inspect.isclass(callable):
                    callable(**kwargs).save()
                else:
                    callable(**kwargs)
            ex = ex_ctx.exception
            self.assertIn(message, str(ex))

    def test_hold_successes(self):
        card1 = self.mp.create_card(**cards.CARD)
        card2 = self.mp.create_card(**cards.CARD)
        buyer = self.mp.create_buyer(self._email_address(), card1.uri)
        buyer.add_card(card2.uri)

        cases = [
            (buyer.hold,
             dict(amount=100),
             balanced.Hold,
             dict(amount=100, account=buyer, source=card2),
             ),
            (buyer.hold,
             dict(amount=123, source_uri=card1.uri),
             balanced.Hold,
             dict(amount=123, account=buyer, source=card1),
             ),
        ]

        holds = self._test_transaction_successes(cases)

        cases = [
            (holds[0].capture,
             dict(),
             balanced.Debit,
             dict(amount=100, account=buyer, source=card2)),
            (holds[1].void,
             dict(),
             None,
             dict())
        ]
        self._test_transaction_successes(cases)

    def test_hold_failures(self):
        card1 = self.mp.create_card(**cards.CARD)
        buyer1 = self.mp.create_buyer(self._email_address(), card1.uri)
        card2 = self.mp.create_card(**cards.CARD)
        buyer2 = self.mp.create_buyer(self._email_address(), card2.uri)

        cases = [
            (buyer1.hold,
             dict(amount=-100),
             balanced.exc.HTTPError,
             'Invalid field [amount] - "-100" must be >= ',
             ),
            (buyer1.hold,
             dict(amount=100, source_uri=card2.uri),
             balanced.exc.HTTPError,
             ' is not associated with account',
             ),
        ]
        self._test_transaction_failures(cases)

    def test_refund_successes(self):
        card1 = self.mp.create_card(**cards.CARD)
        card2 = self.mp.create_card(**cards.CARD)
        buyer = self.mp.create_buyer(self._email_address(), card1.uri)
        buyer.add_card(card2.uri)

        debit1 = buyer.debit(amount=101)
        debit2 = buyer.hold(amount=102).capture()
        debit3 = buyer.debit(amount=103, source_uri=card2.uri)

        cases = [
            (debit1.refund,
             dict(amount=11, description='TestDesc'),
             balanced.Refund,
             dict(debit=debit1, amount=11, description='TestDesc'),
             ),
            (debit2.refund,
             dict(amount=12),
             balanced.Refund,
             dict(debit=debit2, amount=12, description=None),
             ),
            (debit3.refund,
             dict(),
             balanced.Refund,
             dict(debit=debit3, amount=103, description=None),
             ),
        ]
        self._test_transaction_successes(cases)

    def test_refund_failures(self):
        card1 = self.mp.create_card(**cards.CARD)
        card2 = self.mp.create_card(**cards.CARD)
        buyer = self.mp.create_buyer(self._email_address(), card1.uri)
        buyer.add_card(card2.uri)

        debit1 = buyer.debit(amount=101)
        debit1.refund()
        debit2 = buyer.debit(amount=102)

        cases = [
            (debit1.refund,
             dict(),
             balanced.exc.HTTPError,
             'Amount must be less than the remaining debit amount',
             ),
            (debit2.refund,
             dict(amount=1000002),
             balanced.exc.HTTPError,
             'Invalid field [amount] - "1000002" must be <= 102',
             ),
        ]
        self._test_transaction_failures(cases)

    def test_credit_successes(self):
        card = self.mp.create_card(**cards.CARD)
        buyer = self.mp.create_buyer(self._email_address(), card.uri)
        buyer.debit(555)

        ba1 = balanced.BankAccount(
            **bank_accounts.BANK_ACCOUNT).save()
        ba2 = balanced.BankAccount(
            **bank_accounts.BANK_ACCOUNT).save()
        merchant = self.mp.create_merchant(
            self._email_address(),
            merchant=merchants.BUSINESS_MERCHANT,
            bank_account_uri=ba1.uri,
        )
        merchant.add_bank_account(ba2.uri)

        cases = [
            (merchant.credit,
             dict(amount=51),
             balanced.Credit,
             dict(destination=ba2, amount=51),
             ),
            (merchant.credit,
             dict(amount=52, destination_uri=ba1.uri),
             balanced.Credit,
             dict(destination=ba1, amount=52),
             ),
        ]
        self._test_transaction_successes(cases)

    def test_credit_failures(self):
        card = self.mp.create_card(**cards.CARD)
        buyer = self.mp.create_buyer(self._email_address(), card.uri)

        ba1 = balanced.BankAccount(
            **bank_accounts.BANK_ACCOUNT).save()
        ba2 = balanced.BankAccount(
            **bank_accounts.BANK_ACCOUNT).save()
        merchant = self.mp.create_merchant(
            self._email_address(),
            merchant=merchants.BUSINESS_MERCHANT,
            bank_account_uri=ba1.uri,
        )

        cases = [
            (merchant.credit,
             dict(amount=52, destination_uri=ba1.uri),
             balanced.exc.HTTPError,
             'has insufficient funds to cover a transfer of',
             ),
            (merchant.credit,
             dict(amount=52.12),
             balanced.exc.HTTPError,
             '"52.12" is not an integer',
             ),
            (merchant.credit,
             dict(amount=-52),
             balanced.exc.HTTPError,
             '"-52" must be >=',
             ),
        ]
        self._test_transaction_failures(cases)

        buyer.debit(555)

        cases = [
            (merchant.credit,
             dict(amount=52, destination_uri=ba2.uri),
             balanced.exc.HTTPError,
             'is not associated with account',
             ),
        ]
        self._test_transaction_failures(cases)

        ba1.delete()

        cases = [
            (merchant.credit,
             dict(amount=52),
             balanced.exc.HTTPError,
             'has no funding destination',
             ),
        ]
        self._test_transaction_failures(cases)

    def test_debits_successes(self):
        buyer_card = self.mp.create_card(**cards.CARD)
        buyer = self.mp.create_buyer(self._email_address(), buyer_card.uri)

        ba = balanced.BankAccount(
            **bank_accounts.BANK_ACCOUNT).save()
        merchant = self.mp.create_merchant(
            self._email_address(),
            merchant=merchants.BUSINESS_MERCHANT,
            bank_account_uri=ba.uri,
        )
        merchant_card = self.mp.create_card(**cards.CARD)
        merchant.add_card(merchant_card.uri)

        cases = [
            (merchant.debit,
             dict(amount=52),
             balanced.Debit,
             dict(account=merchant,
                  source=merchant_card,
                  amount=52,
                  description=None),
             ),
            (buyer.debit,
             dict(amount=112, description='都留市'),
             balanced.Debit,
             dict(account=buyer,
                  source=buyer_card,
                  amount=112,
                  description='都留市'),
             ),
        ]
        self._test_transaction_successes(cases)

    def test_debits_failures(self):
        buyer_card = self.mp.create_card(**cards.CARD)
        buyer = self.mp.create_buyer(self._email_address(), buyer_card.uri)

        ba = balanced.BankAccount(
            **bank_accounts.BANK_ACCOUNT).save()
        merchant = self.mp.create_merchant(
            self._email_address(),
            merchant=merchants.BUSINESS_MERCHANT,
            bank_account_uri=ba.uri,
        )
        merchant_card = self.mp.create_card(**cards.CARD)
        merchant.add_card(merchant_card.uri)
        merchant_card.is_valid = False
        merchant_card.save()

        cases = [
        ]
        self._test_transaction_failures(cases)

    def test_upgrade_account_to_merchant_invalid_uri(self):
        card = self.mp.create_card(**cards.CARD)
        buyer = self.mp.create_buyer('a@b.com', card.uri)
        with self.assertRaises(balanced.exc.HTTPError) as ex_ctx:
            buyer.promote_to_merchant('/no/a/merchant')
        ex = ex_ctx.exception
        self.assertEqual(ex.status_code, 400)
        self.assertIn(
            'Invalid field [merchant_uri] - "v1/no/a/merchant" does not '
            'resolve to merchant',
            str(ex))

    def test_upgrade_account_to_merchant_success(self):
        card = self.mp.create_card(**cards.CARD)
        with balanced.key_switcher(None):
            api_key = balanced.APIKey().save()
        merchant = api_key.merchant
        buyer = self.mp.create_buyer(self._email_address(), card.uri)
        self.assertItemsEqual(buyer.roles, ['buyer'])
        buyer.promote_to_merchant(merchant.uri)
        self.assertItemsEqual(buyer.roles, ['buyer', 'merchant'])

    def test_debit_uses_newly_added_funding_src(self):
        bank_account = balanced.BankAccount(
            **bank_accounts.BANK_ACCOUNT).save()
        merchant_account = self.mp.create_merchant(
            self._email_address(),
            merchant=merchants.BUSINESS_MERCHANT,
            bank_account_uri=bank_account.uri,
        )

        # debit card
        card = balanced.Card(**cards.CARD).save()
        merchant_account.add_card(card.uri)
        debit = merchant_account.debit(amount=100)
        self.assertEqual(debit.source.id, card.id)

    def test_maximum_credit_amount(self):
        bank_account = balanced.BankAccount(
            **bank_accounts.BANK_ACCOUNT).save()
        merchant_account = self.mp.create_merchant(
            self._email_address(),
            merchant=merchants.BUSINESS_MERCHANT,
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
        card = self.mp.create_card(**cards.CARD)
        buyer = self.mp.create_buyer(self._email_address(), card.uri)
        buyer.debit(200)
        merchant_account.credit(100)

    def test_maximum_debit_amount(self):
        card = self.mp.create_card(**cards.CARD)
        buyer = self.mp.create_buyer(self._email_address(), card.uri)
        with self.assertRaises(balanced.exc.HTTPError) as ex_ctx:
            buyer.debit(10 ** 9 + 1)
        ex = ex_ctx.exception
        self.assertIn('must be <= 1000000000', str(ex))

    def test_maximum_hold_amount(self):
        card = self.mp.create_card(**cards.CARD)
        buyer = self.mp.create_buyer(self._email_address(), card.uri)
        with self.assertRaises(balanced.exc.HTTPError) as ex_ctx:
            buyer.hold(10 ** 9 + 1)
        ex = ex_ctx.exception
        self.assertIn('must be <= 1000000000', str(ex))

    def test_maximum_refund_amount(self):
        bank_account = balanced.BankAccount(
            **bank_accounts.BANK_ACCOUNT).save()
        merchant = self.mp.create_merchant(
            self._email_address(),
            merchant=merchants.BUSINESS_MERCHANT,
            bank_account_uri=bank_account.uri,
        )
        balanced.bust_cache()
        self.mp = balanced.Marketplace.my_marketplace
        if self.mp.in_escrow:
            merchant.credit(self.mp.in_escrow)
        card = self.mp.create_card(**cards.CARD)
        buyer = self.mp.create_buyer(self._email_address(), card.uri)
        debit = buyer.debit(200)
        bank_account = balanced.BankAccount(
            **bank_accounts.BANK_ACCOUNT).save()
        merchant.credit(100)
        with self.assertRaises(balanced.exc.HTTPError) as ex_ctx:
            debit.refund()
        ex = ex_ctx.exception
        self.assertIn('balance insufficient to issue refund', str(ex))
        ex = ex_ctx.exception
        buyer.debit(100)
        debit.refund()

    def test_view_credits_once_bank_account_has_been_invalidated(self):
        bank_account = balanced.BankAccount(
            **bank_accounts.BANK_ACCOUNT).save()
        merchant = self.mp.create_merchant(
            self._email_address(),
            merchant=merchants.BUSINESS_MERCHANT,
            bank_account_uri=bank_account.uri,
        )
        card = self.mp.create_card(
            **cards.CARD)
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
        balanced.Card(**cards.CARD_NO_ADDRESS).save()

    def test_delete_bank_account(self):
        bank_account = balanced.BankAccount(
            **bank_accounts.BANK_ACCOUNT).save()
        bank_account.delete()

    def test_verify_test_bank_account(self):
        bank_account = balanced.BankAccount(
            **bank_accounts.BANK_ACCOUNT).save()
        verification = bank_account.verify()
        verification.confirm(1, 1)
        ex = balanced.exc.FundingInstrumentVerificationFailure
        with self.assertRaises(ex):
            verification.confirm(1, 1)

    def test_verify_test_bank_account_failure(self):
        bank_account = balanced.BankAccount(
            **bank_accounts.BANK_ACCOUNT).save()
        verification = bank_account.verify()
        ex = balanced.exc.FundingInstrumentVerificationFailure
        for _ in range(verification.remaining_attempts):
            with self.assertRaises(ex):
                verification.confirm(1, 2)
        with self.assertRaises(ex):
            verification.confirm(1, 1)
