% if mode == 'definition':
balanced.Refund().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

refund = balanced.Refund.fetch('/refunds/RF6InibH83VMbodkun32mfyU')
refund.description = 'update this description'
refund.meta = {
  'user.refund.count': '3',
  'refund.reason': 'user not happy with product',
  'user.notes': 'very polite on the phone',
}
refund.save()
% elif mode == 'response':
Refund(status=u'succeeded', description=u'update this description', links={u'dispute': None, u'order': None, u'debit': u'WD6GYJu1hYxqJrpXspjFtKSI'}, amount=3000, created_at=u'2014-12-17T00:39:01.856475Z', updated_at=u'2014-12-17T00:41:37.492977Z', currency=u'USD', transaction_number=u'RFQY1-JNA-NGXR', href=u'/refunds/RF6InibH83VMbodkun32mfyU', meta={u'user.refund.count': u'3', u'refund.reason': u'user not happy with product', u'user.notes': u'very polite on the phone'}, id=u'RF6InibH83VMbodkun32mfyU')
% endif