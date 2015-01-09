% if mode == 'definition':
balanced.Debit().refund()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

debit = balanced.Debit.fetch('/debits/WD5Nd61WpdlRk6D39YVNFAEo')
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
Refund(status=u'succeeded', description=u'Refund for Order #1111', links={u'dispute': None, u'order': None, u'debit': u'WD5Nd61WpdlRk6D39YVNFAEo'}, amount=3000, created_at=u'2015-01-09T03:25:00.202596Z', updated_at=u'2015-01-09T03:25:00.686907Z', currency=u'USD', transaction_number=u'RFN4R-7JB-96UV', href=u'/refunds/RF5OXw4w1a9g2GsPqQ2Hg9hj', meta={u'fulfillment.item.condition': u'OK', u'user.refund_reason': u'not happy with product', u'merchant.feedback': u'positive'}, id=u'RF5OXw4w1a9g2GsPqQ2Hg9hj')
% endif