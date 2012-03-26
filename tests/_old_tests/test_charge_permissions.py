import unittest

import mock

import poundpay
from poundpay import ChargePermission


CHARGE_PERMISSION_STATES = frozenset([
    'CREATED',
    'ACTIVE',
    'INACTIVE',
])


class TestChargePermission(unittest.TestCase):

    def setUp(self):
        poundpay.configure(**self.config)

    @property
    def config(self):
        return {'developer_sid': 'DVxxx', 'auth_token': 'AUTH_TOKEN'}

    @property
    def arguments(self):
        return {
            'email_address': u'payer@example.com',
            'sid': u'CPxxx',
        }

    def test_deactivate_throws_exception_if_INACTIVE(self):
        charge_permission = ChargePermission(**self.arguments)
        charge_permission.state = 'INACTIVE'
        with self.assertRaises(poundpay.charge_permissions.ChargePermissionDeactivateError):
            charge_permission.deactivate()

    def test_deactivate_when_CREATED(self):
        kwargs = self.arguments
        kwargs['state'] = 'CREATED'
        charge_permission = ChargePermission(**kwargs)
        with mock.patch.object(ChargePermission, 'save') as patched_save:
            charge_permission.deactivate()
        patched_save.assert_called_once_with()
        self.assertEqual(charge_permission.state, 'INACTIVE')

    def test_deactivate_when_ACTIVE(self):
        kwargs = self.arguments
        kwargs['state'] = 'ACIVE'
        charge_permission = ChargePermission(**kwargs)
        with mock.patch.object(ChargePermission, 'save') as patched_save:
            charge_permission.deactivate()
        patched_save.assert_called_once_with()
        self.assertEqual(charge_permission.state, 'INACTIVE')
