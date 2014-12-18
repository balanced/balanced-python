% if mode == 'definition':
balanced.Debit().refund()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

debit = balanced.Debit.fetch('/debits/WD6GYJu1hYxqJrpXspjFtKSI')
refund = debit.refund(
    amount=3000,
    description="Refund for Order #1111",
    meta={
        "merchant.feedback": "positive",
        "user.refund_reason": "not happy with product",
        "fulfillment.item.condition": "OK",
    }
)
% elif mode == 'response':
Refund(status=u'succeeded', description=u'Refund for Order #1111', links={u'dispute': None, u'order': None, u'debit': u'WD6GYJu1hYxqJrpXspjFtKSI'}, amount=3000, created_at=u'2014-12-17T00:39:01.856475Z', updated_at=u'2014-12-17T00:39:02.247236Z', currency=u'USD', transaction_number=u'RFQY1-JNA-NGXR', href=u'/refunds/RF6InibH83VMbodkun32mfyU', meta={u'fulfillment.item.condition': u'OK', u'user.refund_reason': u'not happy with product', u'merchant.feedback': u'positive'}, id=u'RF6InibH83VMbodkun32mfyU')
% endif