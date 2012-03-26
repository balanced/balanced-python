import unittest

import mock

import poundpay
from poundpay.payments import Payment


PAYMENT_STATES = frozenset([
    'CREATED',
    'AUTHORIZED',
    'ESCROWED',
    'CANCELED',
    'RELEASED',
    'REFUNDED',
    'UNDER_REVIEW',
    'REJECTED',
])


class TestPayment(unittest.TestCase):

    def setUp(self):
        poundpay.configure(**self.config)

    @property
    def config(self):
        return {'developer_sid': 'DVxxx', 'auth_token': 'AUTH_TOKEN'}

    @property
    def payment_arguments(self):
        return {
            'amount': 500,
            'description': u'A description',
            'developer_sid': u'DVxxx',
            'payer_email_address': u'payer@example.com',
            'payer_fee_amount': 200,
            'recipient_email_address': u'recipient@example.com',
            'recipient_fee_amount': 0,
            'sid': u'PYxxx',
        }

    def test_escrow_throws_exception_if_not_AUTHORIZED(self):
        payment = Payment(**self.payment_arguments)
        for state in PAYMENT_STATES:
            if state == 'AUTHORIZED':
                continue
            payment.state = state
            with self.assertRaises(poundpay.payments.PaymentEscrowError):
                payment.escrow()

    def test_release_throws_exception_if_not_ESCROWED(self):
        payment = Payment(**self.payment_arguments)
        for state in PAYMENT_STATES:
            if state == 'ESCROWED':
                continue
            payment.state = state
            with self.assertRaises(poundpay.payments.PaymentReleaseError):
                payment.release()

    def test_cancel_throws_exception_if_not_ESCROWED(self):
        payment = Payment(**self.payment_arguments)
        applicable_states = ('CREATED', 'AUTHORIZED', 'ESCROWED',)
        for state in PAYMENT_STATES:
            if state in applicable_states:
                continue
            payment.state = state
            with self.assertRaises(poundpay.payments.PaymentCancelError) as e:
                payment.cancel()
            exc = e.exception
            self.assertEqual(
                exc.args[0],
                 'Payment state is {}. Only {} payments may be {}'.format(
                     state,
                     ', '.join(applicable_states),
                     'CANCELED'
                     )
                )

    def test_cancel_sets_state_to_cancel_and_issues_save(self):
        kwargs = self.payment_arguments
        kwargs['state'] = 'ESCROWED'
        payment = Payment(**kwargs)
        with mock.patch.object(Payment, 'save') as patched_save:
            payment.cancel()

        patched_save.assert_called_once_with()
        self.assertEqual(payment.state, 'CANCELED')

    def test_release_sets_state_to_released_and_issues_save(self):
        kwargs = self.payment_arguments
        kwargs['state'] = 'ESCROWED'
        payment = Payment(**kwargs)
        with mock.patch.object(Payment, 'save') as patched_save:
            payment.release()

        patched_save.assert_called_once_with()
        self.assertEqual(payment.state, 'RELEASED')

    def test_escrow_sets_state_to_escrowed_and_issues_save(self):
        kwargs = self.payment_arguments
        kwargs['state'] = 'AUTHORIZED'
        payment = Payment(**kwargs)
        with mock.patch.object(Payment, 'save') as patched_save:
            payment.escrow()

        patched_save.assert_called_once_with()
        self.assertEqual(payment.state, 'ESCROWED')
