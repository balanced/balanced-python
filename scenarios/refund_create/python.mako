% if mode == 'definition':
balanced.Debit().refund()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

debit = balanced.Debit.fetch('/debits/WD4LT3ghEgoGK9z4wUQCsKUU')
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
Refund(status=u'succeeded', description=u'Refund for Order #1111', links={u'dispute': None, u'order': None, u'debit': u'WD4LT3ghEgoGK9z4wUQCsKUU'}, amount=3000, created_at=u'2014-12-18T18:22:43.409054Z', updated_at=u'2014-12-18T18:22:43.784433Z', currency=u'USD', transaction_number=u'RF8NW-96D-RK5Z', href=u'/refunds/RF4NfnDkA4JBeXex8N3ZDhMA', meta={u'fulfillment.item.condition': u'OK', u'user.refund_reason': u'not happy with product', u'merchant.feedback': u'positive'}, id=u'RF4NfnDkA4JBeXex8N3ZDhMA')
% endif