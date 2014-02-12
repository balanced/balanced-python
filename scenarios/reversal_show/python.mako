% if mode == 'definition':
balanced.Reversal.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

refund = balanced.Reversal.fetch('/reversals/RV42n8M9XZWna427oPDDi4RG')
% elif mode == 'response':
Reversal(status=u'succeeded', description=u'Reversal for Order #1111', links={u'credit': u'CR40neytmVG2HDBp1opfF7sY', u'order': None}, amount=3000, created_at=u'2014-01-27T22:58:21.214829Z', updated_at=u'2014-01-27T22:58:22.190749Z', failure_reason=None, currency=u'USD', transaction_number=u'RV219-169-0008', href=u'/reversals/RV42n8M9XZWna427oPDDi4RG', meta={u'fulfillment.item.condition': u'OK', u'user.refund_reason': u'not happy with product', u'merchant.feedback': u'positive'}, failure_reason_code=None, id=u'RV42n8M9XZWna427oPDDi4RG')
% endif