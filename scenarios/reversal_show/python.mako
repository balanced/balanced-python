% if mode == 'definition':
balanced.Reversal.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

refund = balanced.Reversal.fetch('/reversals/RV6AleFrrhNHBDpr9W9ozGmY')
% elif mode == 'response':
Reversal(status=u'pending', description=u'Reversal for Order #1111', links={u'credit': u'CR6zeufmfv0u1KHrUBCQtAgU', u'order': None}, amount=3000, created_at=u'2015-01-09T03:25:42.331343Z', updated_at=u'2015-01-09T03:25:42.672661Z', failure_reason=None, currency=u'USD', transaction_number=u'RVYWS-BLM-PY8J', href=u'/reversals/RV6AleFrrhNHBDpr9W9ozGmY', meta={u'fulfillment.item.condition': u'OK', u'user.refund_reason': u'not happy with product', u'merchant.feedback': u'positive'}, failure_reason_code=None, id=u'RV6AleFrrhNHBDpr9W9ozGmY')
% endif