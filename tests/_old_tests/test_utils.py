import unittest

from poundpay.utils import calculate_callback_signature


class TestUtils(unittest.TestCase):

    def test_calculate_callback_signature(self):
        url = 'http://my.callback.url'
        auth_token = 'my-secret-token'
        params = {
            'field1': 'value1',
            'field2': 'value2',
            'field3': 'value3',
            }
        sig = calculate_callback_signature(url, auth_token, params)
        self.assertEqual(sig, 'vlY7lqHMS1X6maqjcRpjh975zog=')

        url = u'http://my.callback.url'
        sig = calculate_callback_signature(url, auth_token, params)
        self.assertEqual(sig, 'vlY7lqHMS1X6maqjcRpjh975zog=')

        params['field1'] = u'value1'
        sig = calculate_callback_signature(url, auth_token, params)
        self.assertEqual(sig, 'vlY7lqHMS1X6maqjcRpjh975zog=')

        del params['field1']
        sig = calculate_callback_signature(url, auth_token, params)
        self.assertNotEqual(sig, 'vlY7lqHMS1X6maqjcRpjh975zog=')
