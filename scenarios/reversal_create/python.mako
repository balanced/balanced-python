% if mode == 'definition':
balanced.Credit().reverse()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

credit = balanced.Credit.fetch('/credits/CR1ynmPUlJGbV9EMyqkowHJP')
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
Reversal(status=u'succeeded', description=u'Reversal for Order #1111', links={u'credit': u'CR1ynmPUlJGbV9EMyqkowHJP', u'order': None}, amount=3000, created_at=u'2014-04-25T22:08:59.215557Z', updated_at=u'2014-04-25T22:08:59.561099Z', failure_reason=None, currency=u'USD', transaction_number=u'RV194-304-9795', href=u'/reversals/RV1zj7hidB6KZ7MxLESBXRJD', meta={u'fulfillment.item.condition': u'OK', u'user.refund_reason': u'not happy with product', u'merchant.feedback': u'positive'}, failure_reason_code=None, id=u'RV1zj7hidB6KZ7MxLESBXRJD')
% endif