% if mode == 'definition':
balanced.Reversal().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

reversal = balanced.Reversal.fetch('/reversals/RV5q7RVGWz47dsBoZGU5OceI')
reversal.description = 'update this description'
reversal.meta = {
  'user.refund.count': '3',
  'refund.reason': 'user not happy with product',
  'user.notes': 'very polite on the phone',
}
reversal.save()
% elif mode == 'response':
Reversal(status=u'pending', description=u'update this description', links={u'credit': u'CR5pb9ux8RYVNTwcJ3jdVF84', u'order': None}, amount=3000, created_at=u'2014-12-18T18:23:17.985164Z', updated_at=u'2014-12-18T18:23:22.449374Z', failure_reason=None, currency=u'USD', transaction_number=u'RVJS6-KNY-IVGE', href=u'/reversals/RV5q7RVGWz47dsBoZGU5OceI', meta={u'user.satisfaction': u'6', u'refund.reason': u'user not happy with product', u'user.notes': u'very polite on the phone'}, failure_reason_code=None, id=u'RV5q7RVGWz47dsBoZGU5OceI')
% endif