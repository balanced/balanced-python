% if mode == 'definition':
balanced.Credit().reverse()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

credit = balanced.Credit.fetch('/credits/CR6nBcaGvGc4dtflEB1bjKBP')
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
Reversal(status=u'succeeded', description=u'Reversal for Order #1111', links={u'credit': u'CR6nBcaGvGc4dtflEB1bjKBP', u'order': None}, amount=3000, created_at=u'2014-04-25T20:18:55.008280Z', updated_at=u'2014-04-25T20:18:57.393905Z', failure_reason=None, currency=u'USD', transaction_number=u'RV296-883-6069', href=u'/reversals/RV6qrEOTouLeIJuPu4s73Ra1', meta={u'fulfillment.item.condition': u'OK', u'user.refund_reason': u'not happy with product', u'merchant.feedback': u'positive'}, failure_reason_code=None, id=u'RV6qrEOTouLeIJuPu4s73Ra1')
% endif