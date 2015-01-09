% if mode == 'definition':
balanced.Refund().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

refund = balanced.Refund.fetch('/refunds/RF5OXw4w1a9g2GsPqQ2Hg9hj')
refund.description = 'update this description'
refund.meta = {
  'user.refund.count': '3',
  'refund.reason': 'user not happy with product',
  'user.notes': 'very polite on the phone',
}
refund.save()
% elif mode == 'response':
Refund(status=u'succeeded', description=u'update this description', links={u'dispute': None, u'order': None, u'debit': u'WD5Nd61WpdlRk6D39YVNFAEo'}, amount=3000, created_at=u'2015-01-09T03:25:00.202596Z', updated_at=u'2015-01-09T03:25:39.570204Z', currency=u'USD', transaction_number=u'RFN4R-7JB-96UV', href=u'/refunds/RF5OXw4w1a9g2GsPqQ2Hg9hj', meta={u'user.refund.count': u'3', u'refund.reason': u'user not happy with product', u'user.notes': u'very polite on the phone'}, id=u'RF5OXw4w1a9g2GsPqQ2Hg9hj')
% endif