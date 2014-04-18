% if mode == 'definition':
balanced.Reversal.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

refund = balanced.Reversal.fetch('/reversals/RV1Lqw4ZTPoeuldngynU1z6J')
% elif mode == 'response':
Reversal(status=u'succeeded', description=u'Reversal for Order #1111', links={u'credit': u'CR1KskgNXcoA6e52QczoCYyF', u'order': None}, amount=3000, created_at=u'2014-04-17T22:40:20.199870Z', updated_at=u'2014-04-17T22:40:20.570448Z', failure_reason=None, currency=u'USD', transaction_number=u'RV365-228-5418', href=u'/reversals/RV1Lqw4ZTPoeuldngynU1z6J', meta={u'fulfillment.item.condition': u'OK', u'user.refund_reason': u'not happy with product', u'merchant.feedback': u'positive'}, failure_reason_code=None, id=u'RV1Lqw4ZTPoeuldngynU1z6J')
% endif