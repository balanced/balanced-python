% if mode == 'definition':
balanced.Reversal().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

reversal = balanced.Reversal.fetch('/reversals/RV6qrEOTouLeIJuPu4s73Ra1')
reversal.description = 'update this description'
reversal.meta = {
  'user.refund.count': '3',
  'refund.reason': 'user not happy with product',
  'user.notes': 'very polite on the phone',
}
reversal.save()
% elif mode == 'response':
Reversal(status=u'succeeded', description=u'update this description', links={u'credit': u'CR6nBcaGvGc4dtflEB1bjKBP', u'order': None}, amount=3000, created_at=u'2014-04-25T20:18:55.008280Z', updated_at=u'2014-04-25T20:19:01.228936Z', failure_reason=None, currency=u'USD', transaction_number=u'RV296-883-6069', href=u'/reversals/RV6qrEOTouLeIJuPu4s73Ra1', meta={u'user.satisfaction': u'6', u'refund.reason': u'user not happy with product', u'user.notes': u'very polite on the phone'}, failure_reason_code=None, id=u'RV6qrEOTouLeIJuPu4s73Ra1')
% endif