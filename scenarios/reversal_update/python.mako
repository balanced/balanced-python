% if mode == 'definition':
balanced.Reversal().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

reversal = balanced.Reversal.fetch('/reversals/RV42n8M9XZWna427oPDDi4RG')
reversal.description = 'update this description'
reversal.meta = {
  'user.refund.count': '3',
  'refund.reason': 'user not happy with product',
  'user.notes': 'very polite on the phone',
}
reversal.save()
% elif mode == 'response':
{u'status': u'succeeded', u'description': u'update this description', u'links': {u'credit': u'CR40neytmVG2HDBp1opfF7sY', u'order': None}, u'updated_at': u'2014-01-27T22:58:27.354488Z', u'created_at': u'2014-01-27T22:58:21.214829Z', u'transaction_number': u'RV219-169-0008', u'failure_reason': None, u'currency': u'USD', u'amount': 3000, u'href': u'/reversals/RV42n8M9XZWna427oPDDi4RG', u'meta': {u'user.satisfaction': u'6', u'refund.reason': u'user not happy with product', u'user.notes': u'very polite on the phone'}, u'failure_reason_code': None, u'id': u'RV42n8M9XZWna427oPDDi4RG'}
% endif