# -*- coding: utf-8 -*-
import unittest

import balanced
from balanced.http_client import wrap_raise_for_status
import mock

import threading


class TestConfig(unittest.TestCase):
    def test_default_config(self):
        config = balanced.config.__class__()
        # this is here because it tests taht if you add anything new
        # then you should test it here..it's not really all encompassing though
        # for example, it won't detect any @property methods..
        self.assertItemsEqual(
            config.__dict__.keys(),
            ['api_key_secret', 'api_version', 'root_uri', 'requests']
        )
        self.assertEqual(config.root_uri, 'https://api.balancedpayments.com')
        self.assertEqual(config.api_version, '1')
        self.assertEqual(config.api_key_secret, None)
        self.assertEqual(config.uri, 'https://api.balancedpayments.com/v1')
        self.assertEqual(config.version, 'v1')


class TestClient(unittest.TestCase):
    def test_http_operations(self):
        ops = ['get', 'post', 'put', 'delete']
        for op in ops:
            request = getattr(balanced.http_client, op)(
                'hithere',
                return_response=False
            )
            self.assertEqual(request.method, op.upper())
            self.assertEqual(
                request.url, 'https://api.balancedpayments.com/v1/hithere'
            )

    def test_client_reference_config(self):
        the_config = balanced.config
        self.assertIsNone(balanced.http_client.config.api_key_secret)
        the_config.api_key_secret = 'khalkhalash'
        self.assertEqual(
            balanced.http_client.config.api_key_secret, 'khalkhalash'
        )

    def test_client_key_switch(self):
        the_config = balanced.config
        current_key = the_config.api_key_secret
        with balanced.key_switcher('new_key'):
            self.assertEqual(the_config.api_key_secret, 'new_key')
        self.assertEqual(the_config.api_key_secret, current_key)


class TestHTTPClient(unittest.TestCase):
    def test_deserialization(self):
        resp = mock.Mock()
        resp.headers = {
            'Content-Type': 'text/html',
        }
        resp.content = 'Unhandled Exception'
        client = balanced.HTTPClient()
        with self.assertRaises(balanced.exc.BalancedError):
            client.deserialize(resp)
        resp.headers['Content-Type'] = 'application/json'
        resp.content = '{"hi": "world"}'
        deserialized = client.deserialize(resp)
        self.assertItemsEqual(deserialized, {u'hi': u'world'})

    def test_deserialization_unicode(self):
        resp = mock.Mock()
        resp.headers = {
            'Content-Type': 'text/html',
        }
        resp.content = 'Unhandled Exception'
        client = balanced.HTTPClient()
        with self.assertRaises(balanced.exc.BalancedError):
            client.deserialize(resp)
        resp.headers['Content-Type'] = 'application/json'
        resp.content = ('{"\\uc800\\uac74 \\ub610 \\ubb50\\uc57c": "second", '
                        '"third": "\\u06a9\\u0647 \\u0686\\u0647 '
                        '\\u06a9\\u062b\\u0627\\u0641\\u062a\\u06cc"}')
        deserialized = client.deserialize(resp)
        self.assertItemsEqual(deserialized, {
            u'third': (u'\u06a9\u0647 \u0686\u0647 '
                       u'\u06a9\u062b\u0627\u0641\u062a\u06cc'),
            u'\uc800\uac74 \ub610 \ubb50\uc57c': u'second'})

    def test_wrap_raise_for_status(self):
        api_response = {'additional': ('Valid email address formats may be '
                                       'found at http://tools.ietf.org/html'
                                       '/rfc2822#section-3.4'),
                        'description': (u'"s\xf8ren.kierkegaard216@yahoo.web" '
                                        u'must be a valid email address as '
                                        u'specified by rfc2822 for email_add'),
                        'status': 'Bad Request',
                        'status_code': 400}
        client = mock.Mock()
        client.deserialize.return_value = api_response
        ex = balanced.exc.HTTPError('Ooops')
        setattr(ex, 'response', mock.Mock())
        ex.response.status_code = 400
        response = mock.Mock()
        response.raise_for_status.side_effect = ex

        wrapped = wrap_raise_for_status(client)
        wrapped(response)

        with self.assertRaises(balanced.exc.HTTPError) as ex:
            response.raise_for_status()
        self.assertEqual(ex.exception.description, api_response['description'])


class TestConfigThread(threading.Thread):
    def __init__( self ):
        threading.Thread.__init__(self)
        self.key = False

    def run(self):
        print balanced.config.api_key_secret, balanced.config
        self.key = balanced.config.api_key_secret == 'test'


class MultiThreadedUserCases(unittest.TestCase):
    def setUp(self):
        balanced.configure('not-test')

    def tearDown(self):
        balanced.configure(None)

    def test_config_does_not_change_across_threads(self):
        threads = []

        for _ in xrange(2):
            t = TestConfigThread()
            threads.append(t)

        # change configuration once the threads are created
        balanced.configure('test')

        for t in threads:
            t.start()

        for t in threads:
            t.join(len(threads))
            self.assertTrue(t.key)
