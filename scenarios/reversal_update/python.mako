% if mode == 'definition':
balanced.Reversal().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

reversal = balanced.Reversal.fetch('/reversals/RV1Lqw4ZTPoeuldngynU1z6J')
reversal.description = 'update this description'
reversal.meta = {
  'user.refund.count': '3',
  'refund.reason': 'user not happy with product',
  'user.notes': 'very polite on the phone',
}
reversal.save()
% elif mode == 'response':
Reversal(status=u'succeeded', description=u'update this description', links={u'credit': u'CR1KskgNXcoA6e52QczoCYyF', u'order': None}, amount=3000, created_at=u'2014-04-17T22:40:20.199870Z', updated_at=u'2014-04-17T22:40:24.560642Z', failure_reason=None, currency=u'USD', transaction_number=u'RV365-228-5418', href=u'/reversals/RV1Lqw4ZTPoeuldngynU1z6J', meta={u'user.satisfaction': u'6', u'refund.reason': u'user not happy with product', u'user.notes': u'very polite on the phone'}, failure_reason_code=None, id=u'RV1Lqw4ZTPoeuldngynU1z6J')
% endif