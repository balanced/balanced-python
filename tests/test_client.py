import unittest

import balanced


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

