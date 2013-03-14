from __future__ import unicode_literals
import datetime
import unittest2 as unittest
import urlparse
import warnings
import mock

import balanced
from balanced.resources import _RESOURCES as resource_registry
from .application import app
from .utils import WSGIServerTest
from .fixtures import resources


class TestResourceConstruction(WSGIServerTest):

    def setUp(self):
        super(TestResourceConstruction, self).setUp()
        balanced.config.root_uri = 'http://localhost:31337'

    def test_property_conversion_from_uri_task_3833(self):
        with self.start_server(app):
            txns = [
                t for t in balanced.Transaction.query
                if 'TEST-MP778-071-6386/debits/W985-622-9570' in t.uri]
            self.assertEqual(txns[0].account_uri, txns[0].account.uri)

    def test_implicit_conversion_to_datetime(self):
        with self.start_server(app):
            for txn in balanced.Transaction.query:
                if isinstance(txn, balanced.Debit):
                    break
            self.assertIsInstance(txn.created_at, datetime.datetime)

    def test_redirects(self):
        with self.start_server(app):
            with self.assertRaises(balanced.exc.HTTPError) as exc:
                balanced.APIKey().save()
            exception = exc.exception
            self.assertEqual(exception.response.status_code, 302)
            self.assertEqual(
                exception.response.headers['location'],
                '/v1/your-mom'
                )


class TestPage(unittest.TestCase):

    def test_filter2(self):
        query = balanced.Marketplace.query
        query = query.filter(balanced.Marketplace.f.a == 'b')
        query = query.filter(balanced.Marketplace.f.a != '101')
        query = query.filter(balanced.Marketplace.f.b < 4)
        query = query.filter(balanced.Marketplace.f.b <= 5)
        query = query.filter(balanced.Marketplace.f.c > 123)
        query = query.filter(balanced.Marketplace.f.c >= 44)
        query = query.filter(balanced.Marketplace.f.d.in_(1, 2, 3))
        query = query.filter(~balanced.Marketplace.f.d.in_(6, 33, 55))
        query = query.filter(balanced.Marketplace.f.e.contains('it'))
        query = query.filter(~balanced.Marketplace.f.e.contains('soda'))
        query = query.filter(balanced.Marketplace.f.f.startswith('la'))
        query = query.filter(balanced.Marketplace.f.f.endswith('lo'))
        query = query.filter(g=12)

        parsed_uri = urlparse.urlparse(query.uri)
        parsed_qs = urlparse.parse_qsl(parsed_uri.query)

        self.assertDictEqual(
            dict(parsed_qs),
            {'a': 'b',
             'a[!=]': '101',
             'b[<=]': '5',
             'b[<]': '4',
             'c[>=]': '44',
             'c[>]': '123',
             'd[!in]': '6,33,55',
             'd[in]': '1,2,3',
             'e[!contains]': 'soda',
             'e[contains]': 'it',
             'f[endswith]': 'lo',
             'f[startswith]': 'la',
             'g': '12',
         })

    def test_sort(self):
        q = balanced.Marketplace.query
        q.sort(balanced.Marketplace.f.me.asc())
        self.assertDictEqual(q.qs, {'sort': ['me,asc']})
        q.sort(balanced.Marketplace.f.u.desc())
        self.assertDictEqual(q.qs, {'sort': ['me,asc', 'u,desc']})

    def test_from_uri_and_dict(self):
        expected = resources.INVOICES.copy()
        expected.pop('uri')
        page = balanced.resources.Page.from_response(**resources.INVOICES)
        self.assertDictEqual(page._lazy_loaded, expected)


class TestMarketplace(unittest.TestCase):

    @mock.patch('balanced.resources.Card')
    def test_region_deprecation(self, _card):
        mkt = balanced.Marketplace()
        with warnings.catch_warnings(record=True) as w:
            mkt.create_card(
                'John Name', '341111111111111', '12', '2020',
                region='CA'
            )
            self.assertEqual(len(w), 1)
            warning_ = w[0]
        self.assertEqual(
            warning_.message.message,
            ('The region parameter will be deprecated in the '
             'next minor version of balanced-python')
        )
        self.assertTrue(isinstance(warning_.message, UserWarning))


class TestResourceIdentification(unittest.TestCase):

    def test_resource(self):
        uris = [
            # marketplace
            (balanced.Marketplace, '/v1/marketplaces/MP123'),
            (balanced.Marketplace, '/v1/marketplaces'),
            # nested under marketplace
            (balanced.Credit, '/v1/marketplaces/credits'),
            (balanced.Credit, '/v1/marketplaces/credits/C1'),
            # root
            (balanced.Event, '/v1/events'),
            (balanced.Event, '/v1/events/E1'),
            # nested under events
            (balanced.EventCallback, '/v1/events/E1/callbacks'),
            (balanced.EventCallback, '/v1/events/E1/callbacks/C1'),
            # nested under events and callbacks
            (balanced.EventCallbackLog, '/v1/events/E1/callbacks/C1/logs'),
            (balanced.EventCallbackLog, '/v1/events/E1/callbacks/C1/logs/L1'),
        ]
        for expected_type, uri in uris:
            derived_type = resource_registry.from_uri(uri)
            self.assertEqual(expected_type, derived_type)
