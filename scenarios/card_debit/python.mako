% if mode == 'definition':
balanced.Card().debit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

card = balanced.Card.fetch('/cards/CC4tvKLTKXcBJAgkGvPEW58N')
card.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': u'CU3VYCUIfwngJsidJWdGw2W5', u'source': u'CC4tvKLTKXcBJAgkGvPEW58N', u'order': None, u'dispute': None}, amount=5000, created_at=u'2014-04-25T20:10:20.485474Z', updated_at=u'2014-04-25T20:10:21.476140Z', failure_reason=None, currency=u'USD', transaction_number=u'W060-183-8881', href=u'/debits/WD4SOTNKiZbBFrmMk6mfszIl', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WD4SOTNKiZbBFrmMk6mfszIl')
% endif