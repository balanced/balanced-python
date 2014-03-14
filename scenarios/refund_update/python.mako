% if mode == 'definition':
balanced.Refund().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

refund = balanced.Refund.fetch('/refunds/RF6HsnqferSuES9VZEWrthG2')
refund.description = 'update this description'
refund.meta = {
  'user.refund.count': '3',
  'refund.reason': 'user not happy with product',
  'user.notes': 'very polite on the phone',
}
refund.save()
% elif mode == 'response':
Refund(status=u'succeeded', description=u'update this description', links={u'dispute': None, u'order': None, u'debit': u'WD6BKYhbRzlRhfKSE1DcpqS5'}, amount=3000, created_at=u'2014-03-06T19:23:46.176138Z', updated_at=u'2014-03-06T19:23:53.123358Z', currency=u'USD', transaction_number=u'RF348-549-7723', href=u'/refunds/RF6HsnqferSuES9VZEWrthG2', meta={u'user.refund.count': u'3', u'refund.reason': u'user not happy with product', u'user.notes': u'very polite on the phone'}, id=u'RF6HsnqferSuES9VZEWrthG2')
% endif