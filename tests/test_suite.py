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
        api_key = balanced.APIKey().save()
        balanced.configure(api_key.secret)
        cls.marketplace = balanced.Marketplace().save()

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
        bank_account.associate_to(customer)
        bank_account.unstore()

    def test_delete_card(self):
        customer = balanced.Customer().save()
        card = balanced.Card(**CARD).save()
        card.associate_to(customer)
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
        bank_account.associate_to(merchant)

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
