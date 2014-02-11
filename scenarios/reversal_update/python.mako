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
Reversal(
 'amount': 3000,
 'created_at': u'2014-01-27T22:58:21.214829Z',
 'currency': u'USD',
 'description': u'update this description',
 'failure_reason': None,
 'failure_reason_code': None,
 'href': u'/reversals/RV42n8M9XZWna427oPDDi4RG',
 'id': u'RV42n8M9XZWna427oPDDi4RG',
 'links': {u'credit': u'CR40neytmVG2HDBp1opfF7sY', u'order': None},
 'meta': {u'refund.reason': u'user not happy with product',
          u'user.notes': u'very polite on the phone',
          u'user.satisfaction': u'6'},
 'status': u'succeeded',
 'transaction_number': u'RV219-169-0008',
 'updated_at': u'2014-01-27T22:58:27.354488Z')
 
% endif