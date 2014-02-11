% if mode == 'definition':
balanced.Refund.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

refund = balanced.Refund.fetch('/refunds/RF3RklPuFgsgI50UuYtr4g6I')
% elif mode == 'response':
Refund(**{
 'amount': 3000,
 'created_at': u'2014-01-27T22:58:11.375665Z',
 'currency': u'USD',
 'description': u'Refund for Order #1111',
 'href': u'/refunds/RF3RklPuFgsgI50UuYtr4g6I',
 'id': u'RF3RklPuFgsgI50UuYtr4g6I',
 'links': {u'debit': u'WD3MKNxNTKBGgA7mX50yogiu',
           u'dispute': None,
           u'order': None},
 'meta': {u'fulfillment.item.condition': u'OK',
          u'merchant.feedback': u'positive',
          u'user.refund_reason': u'not happy with product'},
 'status': u'succeeded',
 'transaction_number': u'RF383-088-7077',
 'updated_at': u'2014-01-27T22:58:12.115131Z'
})
% endif