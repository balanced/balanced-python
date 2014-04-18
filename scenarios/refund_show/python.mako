% if mode == 'definition':
balanced.Refund.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

refund = balanced.Refund.fetch('/refunds/RF1mYWVCnVu5NkDAl47rDgMx')
% elif mode == 'response':
Refund(status=u'succeeded', description=u'Refund for Order #1111', links={u'dispute': None, u'order': None, u'debit': u'WD19cDwPJMMJj6UWn4YI2bGZ'}, amount=3000, created_at=u'2014-04-17T22:39:47.779017Z', updated_at=u'2014-04-17T22:39:48.442287Z', currency=u'USD', transaction_number=u'RF938-498-8864', href=u'/refunds/RF1mYWVCnVu5NkDAl47rDgMx', meta={u'fulfillment.item.condition': u'OK', u'user.refund_reason': u'not happy with product', u'merchant.feedback': u'positive'}, id=u'RF1mYWVCnVu5NkDAl47rDgMx')
% endif