% if mode == 'definition':
balanced.Refund().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

refund = balanced.Refund.fetch('/refunds/RF4NfnDkA4JBeXex8N3ZDhMA')
refund.description = 'update this description'
refund.meta = {
  'user.refund.count': '3',
  'refund.reason': 'user not happy with product',
  'user.notes': 'very polite on the phone',
}
refund.save()
% elif mode == 'response':
Refund(status=u'succeeded', description=u'update this description', links={u'dispute': None, u'order': None, u'debit': u'WD4LT3ghEgoGK9z4wUQCsKUU'}, amount=3000, created_at=u'2014-12-18T18:22:43.409054Z', updated_at=u'2014-12-18T18:23:15.459974Z', currency=u'USD', transaction_number=u'RF8NW-96D-RK5Z', href=u'/refunds/RF4NfnDkA4JBeXex8N3ZDhMA', meta={u'user.refund.count': u'3', u'refund.reason': u'user not happy with product', u'user.notes': u'very polite on the phone'}, id=u'RF4NfnDkA4JBeXex8N3ZDhMA')
% endif