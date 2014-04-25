% if mode == 'definition':
balanced.Refund().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

refund = balanced.Refund.fetch('/refunds/RF4VbbS5LdgSxlECITkHg0Zf')
refund.description = 'update this description'
refund.meta = {
  'user.refund.count': '3',
  'refund.reason': 'user not happy with product',
  'user.notes': 'very polite on the phone',
}
refund.save()
% elif mode == 'response':
Refund(status=u'succeeded', description=u'update this description', links={u'dispute': None, u'order': None, u'debit': u'WD4SOTNKiZbBFrmMk6mfszIl'}, amount=3000, created_at=u'2014-04-25T20:10:22.593252Z', updated_at=u'2014-04-25T20:18:50.969971Z', currency=u'USD', transaction_number=u'RF854-846-2859', href=u'/refunds/RF4VbbS5LdgSxlECITkHg0Zf', meta={u'user.refund.count': u'3', u'refund.reason': u'user not happy with product', u'user.notes': u'very polite on the phone'}, id=u'RF4VbbS5LdgSxlECITkHg0Zf')
% endif