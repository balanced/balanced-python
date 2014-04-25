% if mode == 'definition':
balanced.Debit().refund()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

debit = balanced.Debit.fetch('/debits/WD4SOTNKiZbBFrmMk6mfszIl')
refund = debit.refund(
    amount=3000,
    description="Refund for Order #1111",
    meta={
        "merchant.feedback": "positive",
        "user.refund_reason": "not happy with product",
        "fulfillment.item.condition": "OK",
    }
)
% elif mode == 'response':
Refund(status=u'succeeded', description=u'Refund for Order #1111', links={u'dispute': None, u'order': None, u'debit': u'WD4SOTNKiZbBFrmMk6mfszIl'}, amount=3000, created_at=u'2014-04-25T20:10:22.593252Z', updated_at=u'2014-04-25T20:10:23.032505Z', currency=u'USD', transaction_number=u'RF854-846-2859', href=u'/refunds/RF4VbbS5LdgSxlECITkHg0Zf', meta={u'fulfillment.item.condition': u'OK', u'user.refund_reason': u'not happy with product', u'merchant.feedback': u'positive'}, id=u'RF4VbbS5LdgSxlECITkHg0Zf')
% endif