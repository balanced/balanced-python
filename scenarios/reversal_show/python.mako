% if mode == 'definition':
balanced.Reversal.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

refund = balanced.Reversal.fetch('/reversals/RV5q7RVGWz47dsBoZGU5OceI')
% elif mode == 'response':
Reversal(status=u'pending', description=u'Reversal for Order #1111', links={u'credit': u'CR5pb9ux8RYVNTwcJ3jdVF84', u'order': None}, amount=3000, created_at=u'2014-12-18T18:23:17.985164Z', updated_at=u'2014-12-18T18:23:18.261789Z', failure_reason=None, currency=u'USD', transaction_number=u'RVJS6-KNY-IVGE', href=u'/reversals/RV5q7RVGWz47dsBoZGU5OceI', meta={u'fulfillment.item.condition': u'OK', u'user.refund_reason': u'not happy with product', u'merchant.feedback': u'positive'}, failure_reason_code=None, id=u'RV5q7RVGWz47dsBoZGU5OceI')
% endif