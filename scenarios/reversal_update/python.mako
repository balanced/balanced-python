% if mode == 'definition':
balanced.Reversal().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

reversal = balanced.Reversal.fetch('/reversals/RV1N9oslZhbE86nYOnfJHzHO')
reversal.description = 'update this description'
reversal.meta = {
  'user.refund.count': '3',
  'refund.reason': 'user not happy with product',
  'user.notes': 'very polite on the phone',
}
reversal.save()
% elif mode == 'response':
Reversal(status=u'pending', description=u'update this description', links={u'credit': u'CR1McWlTSms6PWdGk0HHFdNH', u'order': None}, amount=3000, created_at=u'2014-12-17T00:41:39.980954Z', updated_at=u'2014-12-17T00:41:44.834604Z', failure_reason=None, currency=u'USD', transaction_number=u'RVMQC-O8G-WHER', href=u'/reversals/RV1N9oslZhbE86nYOnfJHzHO', meta={u'user.satisfaction': u'6', u'refund.reason': u'user not happy with product', u'user.notes': u'very polite on the phone'}, failure_reason_code=None, id=u'RV1N9oslZhbE86nYOnfJHzHO')
% endif