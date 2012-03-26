import unittest

import mock

import poundpay
from poundpay.developers import Developer


class TestDeveloper(unittest.TestCase):

    def test_find_me(self):
        poundpay.configure('DVxxx', 'AUTH_TOKEN')

        with mock.patch.object(Developer, 'find') as patched_find:
            patched_find.return_value = mock.sentinel
            self.assertEqual(Developer.find_me(), mock.sentinel)

        patched_find.assert_called_once_with('DVxxx')
