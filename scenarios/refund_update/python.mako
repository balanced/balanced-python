% if mode == 'definition':
balanced.Refund().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

refund = balanced.Refund.fetch('/refunds/RF3RklPuFgsgI50UuYtr4g6I')
refund.description = 'update this description'
refund.meta = {
  'user.refund.count': '3',
  'refund.reason': 'user not happy with product',
  'user.notes': 'very polite on the phone',
}
refund.save()
% elif mode == 'response':
Refund(
 'amount': 3000,
 'created_at': u'2014-01-27T22:58:11.375665Z',
 'currency': u'USD',
 'description': u'update this description',
 'href': u'/refunds/RF3RklPuFgsgI50UuYtr4g6I',
 'id': u'RF3RklPuFgsgI50UuYtr4g6I',
 'links': {u'debit': u'WD3MKNxNTKBGgA7mX50yogiu',
           u'dispute': None,
           u'order': None},
 'meta': {u'refund.reason': u'user not happy with product',
          u'user.notes': u'very polite on the phone',
          u'user.refund.count': u'3'},
 'status': u'succeeded',
 'transaction_number': u'RF383-088-7077',
 'updated_at': u'2014-01-27T22:58:17.950799Z')
 
% endif