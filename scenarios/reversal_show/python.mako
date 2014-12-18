% if mode == 'definition':
balanced.Reversal.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

refund = balanced.Reversal.fetch('/reversals/RV1N9oslZhbE86nYOnfJHzHO')
% elif mode == 'response':
Reversal(status=u'pending', description=u'Reversal for Order #1111', links={u'credit': u'CR1McWlTSms6PWdGk0HHFdNH', u'order': None}, amount=3000, created_at=u'2014-12-17T00:41:39.980954Z', updated_at=u'2014-12-17T00:41:40.252934Z', failure_reason=None, currency=u'USD', transaction_number=u'RVMQC-O8G-WHER', href=u'/reversals/RV1N9oslZhbE86nYOnfJHzHO', meta={u'fulfillment.item.condition': u'OK', u'user.refund_reason': u'not happy with product', u'merchant.feedback': u'positive'}, failure_reason_code=None, id=u'RV1N9oslZhbE86nYOnfJHzHO')
% endif