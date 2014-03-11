% if mode == 'definition':
balanced.Refund.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

refund = balanced.Refund.fetch('/refunds/RF6HsnqferSuES9VZEWrthG2')
% elif mode == 'response':
Refund(status=u'succeeded', description=u'Refund for Order #1111', links={u'dispute': None, u'order': None, u'debit': u'WD6BKYhbRzlRhfKSE1DcpqS5'}, amount=3000, created_at=u'2014-03-06T19:23:46.176138Z', updated_at=u'2014-03-06T19:23:48.234584Z', currency=u'USD', transaction_number=u'RF348-549-7723', href=u'/refunds/RF6HsnqferSuES9VZEWrthG2', meta={u'fulfillment.item.condition': u'OK', u'user.refund_reason': u'not happy with product', u'merchant.feedback': u'positive'}, id=u'RF6HsnqferSuES9VZEWrthG2')
% endif