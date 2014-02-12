% if mode == 'definition':
balanced.Refund.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

refund = balanced.Refund.fetch('/refunds/RF3RklPuFgsgI50UuYtr4g6I')
% elif mode == 'response':
Refund(status=u'succeeded', description=u'Refund for Order #1111', links={u'dispute': None, u'order': None, u'debit': u'WD3MKNxNTKBGgA7mX50yogiu'}, amount=3000, created_at=u'2014-01-27T22:58:11.375665Z', updated_at=u'2014-01-27T22:58:12.115131Z', currency=u'USD', transaction_number=u'RF383-088-7077', href=u'/refunds/RF3RklPuFgsgI50UuYtr4g6I', meta={u'fulfillment.item.condition': u'OK', u'user.refund_reason': u'not happy with product', u'merchant.feedback': u'positive'}, id=u'RF3RklPuFgsgI50UuYtr4g6I')
% endif