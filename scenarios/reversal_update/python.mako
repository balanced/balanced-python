% if mode == 'definition':
balanced.Reversal().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

reversal = balanced.Reversal.fetch('/reversals/RV6AleFrrhNHBDpr9W9ozGmY')
reversal.description = 'update this description'
reversal.meta = {
  'user.refund.count': '3',
  'refund.reason': 'user not happy with product',
  'user.notes': 'very polite on the phone',
}
reversal.save()
% elif mode == 'response':
Reversal(status=u'pending', description=u'update this description', links={u'credit': u'CR6zeufmfv0u1KHrUBCQtAgU', u'order': None}, amount=3000, created_at=u'2015-01-09T03:25:42.331343Z', updated_at=u'2015-01-09T03:25:46.424201Z', failure_reason=None, currency=u'USD', transaction_number=u'RVYWS-BLM-PY8J', href=u'/reversals/RV6AleFrrhNHBDpr9W9ozGmY', meta={u'user.satisfaction': u'6', u'refund.reason': u'user not happy with product', u'user.notes': u'very polite on the phone'}, failure_reason_code=None, id=u'RV6AleFrrhNHBDpr9W9ozGmY')
% endif