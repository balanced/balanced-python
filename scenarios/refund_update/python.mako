% if mode == 'definition':
balanced.Refund().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

refund = balanced.Refund.fetch('/refunds/RF1mYWVCnVu5NkDAl47rDgMx')
refund.description = 'update this description'
refund.meta = {
  'user.refund.count': '3',
  'refund.reason': 'user not happy with product',
  'user.notes': 'very polite on the phone',
}
refund.save()
% elif mode == 'response':
Refund(status=u'succeeded', description=u'update this description', links={u'dispute': None, u'order': None, u'debit': u'WD19cDwPJMMJj6UWn4YI2bGZ'}, amount=3000, created_at=u'2014-04-17T22:39:47.779017Z', updated_at=u'2014-04-17T22:40:17.834532Z', currency=u'USD', transaction_number=u'RF938-498-8864', href=u'/refunds/RF1mYWVCnVu5NkDAl47rDgMx', meta={u'user.refund.count': u'3', u'refund.reason': u'user not happy with product', u'user.notes': u'very polite on the phone'}, id=u'RF1mYWVCnVu5NkDAl47rDgMx')
% endif