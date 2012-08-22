from __future__ import unicode_literals
import datetime
import unittest

import balanced
from balanced.resources import Resource
from .application import app
from .utils import WSGIServerTest


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


class MyResource(Resource):
    def __init__(self):
        pass

class TestRepr(unittest.TestCase):

    def test_repr_basically_works(self):
        resource = Resource()
        self.assertEqual(repr(resource), "Resource()")

    def test_repr_works_more_complicately(self):
        resource = MyResource()
        resource.cheese = u'balls'
        self.assertEqual(repr(resource), "MyResource(cheese = u'balls')")

    def test_repr_lines_up_attrs(self):
        resource = MyResource()
        resource.cheese = u'balls'
        resource.gee = u'whiz'
        self.assertEqual(repr(resource), """\
MyResource(cheese       = u'balls',
           gee          = u'whiz')""")

    def test_repr_keeps_lining_up_attrs_and_does_other_stuff(self):
        resource = MyResource()
        resource.cheese = u'balls'
        resource.gee = u'whiz'
        resource.foo = u'alleroo'
        resource.bar = u'blah'
        resource.baz_baz_baz_baz = u'blooo'
        resource.buz = u'blam'
        self.assertEqual(repr(resource), """\
MyResource(bar          = u'blah',
           baz_baz_baz_baz = u'blooo',
           buz          = u'blam',
           cheese       = u'balls',
           foo          = u'alleroo',
           gee          = u'whiz')"""),

    def test_repr_nests_Resources(self):
        resource = MyResource()
        resource.cheese = u'balls'
        resource.gee = u'whiz'
        resource.blah = MyResource()
        resource.blah.beach = u'weather'
        self.assertEqual(repr(resource), """\
MyResource(blah         = MyResource(beach = u'weather'),
           cheese       = u'balls',
           gee          = u'whiz')""")

    def test_repr_lines_up_nested_Resources(self):
        resource = MyResource()
        resource.cheese = u'balls'
        resource.gee = u'whiz'
        resource.blah = MyResource()
        resource.blah.beach = u'weather'
        resource.blah.weather = u'man'
        resource.blah.man = u'child'
        self.assertEqual(repr(resource), """\
MyResource(blah         = MyResource(beach        = u'weather',
                                     man          = u'child',
                                     weather      = u'man'),
           cheese       = u'balls',
           gee          = u'whiz')""")


class TestPage(unittest.TestCase):

    def test_filter2(self):
        q = balanced.Marketplace.query
        q.filter(balanced.Marketplace.f.a == 'b')
        q.filter(balanced.Marketplace.f.a != '101')
        q.filter(balanced.Marketplace.f.b < 4)
        q.filter(balanced.Marketplace.f.b <= 5)
        q.filter(balanced.Marketplace.f.c > 123)
        q.filter(balanced.Marketplace.f.c >= 44)
        q.filter(balanced.Marketplace.f.d.in_(1, 2, 3))
        q.filter(~balanced.Marketplace.f.d.in_(6, 33, 55))
        q.filter(balanced.Marketplace.f.e.contains('it'))
        q.filter(~balanced.Marketplace.f.e.contains('soda'))
        q.filter(balanced.Marketplace.f.f.startswith('la'))
        q.filter(balanced.Marketplace.f.f.endswith('lo'))
        q.filter(g=12)
        self.assertEqual(
            q.qs,
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
        self.assertEqual(q.qs, {'sort': ['me,asc']})
        q.sort(balanced.Marketplace.f.u.desc())
        self.assertEqual(q.qs, {'sort': ['me,asc', 'u,desc']})
