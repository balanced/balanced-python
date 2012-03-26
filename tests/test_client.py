import unittest

import balanced


# class TestClientResponse(unittest.TestCase):

#     def test_client_response_constructor_arguments(self):
#         sentinal_1 = object()
#         sentinal_2 = object()
#         client_response = ClientResponse(sentinal_1, sentinal_2)
#         self.assertIs(client_response.response, sentinal_1)
#         self.assertIs(client_response.data, sentinal_2)

#     def test_client_json_property(self):
#         client_response = ClientResponse(None, json.dumps({'foo': 'bar'}))
#         self.assertEqual(client_response.json, {'foo': 'bar'})

#     def test_str(self):
#         response = mock.Mock()
#         response.msg = 'OK'
#         response.getcode.return_value = '200'
#         client_response = ClientResponse(
#             response,
#             json.dumps({'foo': 'bar'})
#             )
#         self.assertEqual(
#             str(client_response), "[200 OK] - {'foo': 'bar'}"
#             )

"""
import balanced
self.assertNone(balanced.client.token)
marketplace = balanced.Marketplace().save()
# token is set.
self.assertIsNotNone(balanced.client.token)
self.assertIsNotNone(marketplace.account)
account = marketplace.account
self.assertEqual(account.roles, [balanced.Account.MERCHANT])
self.assertEqual(account.roles, [balanced.Account.MERCHANT])

debit = marketplace.account.debit(5000)


mp = Marketplace().save()
debit = mp.account.debit()
mp.account.roles, [Account.MERCHANT]
debit.refunds, []
debit.meta['nope'] = 'hi'
debit.save()
refund = debit.refund()
credit = mp.account.credit()
debit2 = credit.reverse()
authorization = mp.account.authorize(meta={'khal': 'khalash'})
authorization.void()
authorizaton.is_void

mp.account.save()
balanced.dashboard_link
>>> https://dashboard.balancedpayments.com/M123-111-3333/
balanced.Marketplace().save()
# associated with the same auth token
balanced.i_want_to_go_live
>>> ....

"""


class TestConfig(unittest.TestCase):

    def test_default_config(self):
        config = balanced.config.Config()
        # this is here because it tests taht if you add anything new
        # then you should test it here..it's not really all encompassing though
        # for example, it won't detect any @property methods..
        self.assertItemsEqual(
            config.__dict__.keys(),
            ['api_key', 'api_version', 'root_uri', 'requests']
            )
        self.assertEqual(config.root_uri, 'https://api.balancedpayments.com')
        self.assertEqual(config.api_version, '1')
        self.assertEqual(config.api_key, None)
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
        the_config = balanced.c
        self.assertIsNone(balanced.http_client.config.api_key)
        the_config.api_key = 'khalkhalash'
        self.assertEqual(balanced.http_client.config.api_key, 'khalkhalash')

    def test_client_key_switch(self):
        the_config = balanced.c
        current_key = the_config.api_key
        with balanced.key_switcher('new_key'):
            self.assertEqual(the_config.api_key, 'new_key')
        self.assertEqual(the_config.api_key, current_key)
