import unittest

import poundpay


class TestUsers(unittest.TestCase):

    def setUp(self):
        poundpay.configure(**self.config)

    @property
    def config(self):
        return {'developer_sid': 'DVxxx', 'auth_token': 'AUTH_TOKEN'}

    def test_user_is_a_resource(self):
        self.assertIn(poundpay.Resource, poundpay.User.__bases__)
