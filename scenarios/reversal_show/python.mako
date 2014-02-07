% if mode == 'definition':
balanced.Reversal.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

refund = balanced.Reversal.fetch('/reversals/RV42n8M9XZWna427oPDDi4RG')
% elif mode == 'response':
{u'status': u'succeeded', u'description': u'Reversal for Order #1111', u'links': {u'credit': u'CR40neytmVG2HDBp1opfF7sY', u'order': None}, u'updated_at': u'2014-01-27T22:58:22.190749Z', u'created_at': u'2014-01-27T22:58:21.214829Z', u'transaction_number': u'RV219-169-0008', u'failure_reason': None, u'currency': u'USD', u'amount': 3000, u'href': u'/reversals/RV42n8M9XZWna427oPDDi4RG', u'meta': {u'fulfillment.item.condition': u'OK', u'user.refund_reason': u'not happy with product', u'merchant.feedback': u'positive'}, u'failure_reason_code': None, u'id': u'RV42n8M9XZWna427oPDDi4RG'}
% endif