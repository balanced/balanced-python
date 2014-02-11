% if mode == 'definition':
balanced.Credit().reverse()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

credit = balanced.Credit.fetch('/credits/CR40neytmVG2HDBp1opfF7sY')
reversal = credit.reverse(
    amount=3000,
    description="Reversal for Order #1111",
    meta={
        "merchant.feedback": "positive",
        "user.refund_reason": "not happy with product",
        "fulfillment.item.condition": "OK",
    }
)
% elif mode == 'response':
Reversal(**{
 'amount': 3000,
 'created_at': u'2014-01-27T22:58:21.214829Z',
 'currency': u'USD',
 'description': u'Reversal for Order #1111',
 'failure_reason': None,
 'failure_reason_code': None,
 'href': u'/reversals/RV42n8M9XZWna427oPDDi4RG',
 'id': u'RV42n8M9XZWna427oPDDi4RG',
 'links': {u'credit': u'CR40neytmVG2HDBp1opfF7sY', u'order': None},
 'meta': {u'fulfillment.item.condition': u'OK',
          u'merchant.feedback': u'positive',
          u'user.refund_reason': u'not happy with product'},
 'status': u'succeeded',
 'transaction_number': u'RV219-169-0008',
 'updated_at': u'2014-01-27T22:58:22.190749Z'
})
% endif