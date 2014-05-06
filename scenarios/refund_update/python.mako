% if mode == 'definition':
balanced.Refund().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

refund = balanced.Refund.fetch('/refunds/RFFFulVVpBiNWpJ2VLMto1L')
refund.description = 'update this description'
refund.meta = {
  'user.refund.count': '3',
  'refund.reason': 'user not happy with product',
  'user.notes': 'very polite on the phone',
}
refund.save()
% elif mode == 'response':
Refund(status=u'succeeded', description=u'update this description', links={u'dispute': None, u'order': None, u'debit': u'WDEg9ofx83CeAhiwI1QmA17'}, amount=3000, created_at=u'2014-04-25T22:01:00.249873Z', updated_at=u'2014-04-25T22:08:56.890917Z', currency=u'USD', transaction_number=u'RF718-148-9846', href=u'/refunds/RFFFulVVpBiNWpJ2VLMto1L', meta={u'user.refund.count': u'3', u'refund.reason': u'user not happy with product', u'user.notes': u'very polite on the phone'}, id=u'RFFFulVVpBiNWpJ2VLMto1L')
% endif