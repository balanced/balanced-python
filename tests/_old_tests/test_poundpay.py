import unittest

import poundpay


class TestConfigureFunction(unittest.TestCase):

    def test_configure_function_with_defaults(self):
        poundpay.Client.API_URL = 'URL'
        poundpay.Client.API_VERSION = 'VERSION'

        poundpay.configure('DVSID', 'TOKEN')

        self.assertEqual(poundpay.Resource.client.base_url, 'URL/VERSION/')
