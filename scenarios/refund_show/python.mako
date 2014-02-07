% if mode == 'definition':
balanced.Refund.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

refund = balanced.Refund.fetch('/refunds/RF3RklPuFgsgI50UuYtr4g6I')
% elif mode == 'response':
{u'status': u'succeeded', u'description': u'Refund for Order #1111', u'links': {u'dispute': None, u'order': None, u'debit': u'WD3MKNxNTKBGgA7mX50yogiu'}, u'created_at': u'2014-01-27T22:58:11.375665Z', u'transaction_number': u'RF383-088-7077', u'updated_at': u'2014-01-27T22:58:12.115131Z', u'currency': u'USD', u'amount': 3000, u'href': u'/refunds/RF3RklPuFgsgI50UuYtr4g6I', u'meta': {u'fulfillment.item.condition': u'OK', u'user.refund_reason': u'not happy with product', u'merchant.feedback': u'positive'}, u'id': u'RF3RklPuFgsgI50UuYtr4g6I'}
% endif