% if mode == 'definition':
balanced.Reversal().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

reversal = balanced.Reversal.fetch('/reversals/RV1zj7hidB6KZ7MxLESBXRJD')
reversal.description = 'update this description'
reversal.meta = {
  'user.refund.count': '3',
  'refund.reason': 'user not happy with product',
  'user.notes': 'very polite on the phone',
}
reversal.save()
% elif mode == 'response':
Reversal(status=u'succeeded', description=u'update this description', links={u'credit': u'CR1ynmPUlJGbV9EMyqkowHJP', u'order': None}, amount=3000, created_at=u'2014-04-25T22:08:59.215557Z', updated_at=u'2014-04-25T22:09:03.300997Z', failure_reason=None, currency=u'USD', transaction_number=u'RV194-304-9795', href=u'/reversals/RV1zj7hidB6KZ7MxLESBXRJD', meta={u'user.satisfaction': u'6', u'refund.reason': u'user not happy with product', u'user.notes': u'very polite on the phone'}, failure_reason_code=None, id=u'RV1zj7hidB6KZ7MxLESBXRJD')
% endif