from __future__ import unicode_literals

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
from .application import app
from .utils import WSGIServerTest


class TestMarketplaces(WSGIServerTest):

    def setUp(self):
        super(TestMarketplaces, self).setUp()
        balanced.c.root_uri = 'http://localhost:31337'

    def test_unauthorized_creation_of_marketplaces(self):
        balanced.c.api_key = None
        with self.start_server(app):
            mp = balanced.Marketplace().save()
        self.assertEqual(
            balanced.c.api_key, 'd8e7d4406a1e11e193bee4ce8f4a4f46')
        self.assertEqual(mp.uri, '/v1/marketplaces/TEST-M123-456-7890')
        self.assertEqual(mp.id, 'TEST-M123-456-7890')
        self.assertIsInstance(mp.account, balanced.Account)
        self.assertDictEqual(mp.meta, {})

        with self.start_server(app):
            mp.save()
        self.assertIsInstance(mp.account, balanced.Account)

    def test_pagination_of_marketplaces(self):
        with self.start_server(app):
            self.assertEqual(len(list(balanced.Marketplace.all())), 2)
            for mp in balanced.Marketplace.all():
                self.assertIsNotNone(mp.uri)

    def test_slicing_of_resources_restricts_results_returned(self):
        with self.start_server(app):
            idx = balanced.Marketplace.all(limit=2, offset=0, pages=10, num=2)
            length = len(list(idx))
            # test number of results is pages * num = 20
            self.assertEqual(length, 20)
            length = len(list(idx[:8]))
            # test number of results is 8 due to slicing syntax
            self.assertEqual(length, 8)

    def test_nonslice_value_fails(self):
        with self.start_server(app):
            idx = balanced.Marketplace.all(limit=2, offset=0, pages=10, num=2)
            with self.assertRaises(ValueError):
                idx['something']
