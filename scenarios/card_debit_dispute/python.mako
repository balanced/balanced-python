% if mode == 'definition':
balanced.Card().debit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

card = balanced.Card.fetch('/cards/CC4XMSQg2OY6rrcrkeEGtLcZ')
card.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': None, u'source': u'CC4XMSQg2OY6rrcrkeEGtLcZ', u'order': None, u'dispute': None}, amount=5000, created_at=u'2014-04-25T20:10:25.648099Z', updated_at=u'2014-04-25T20:10:26.775361Z', failure_reason=None, currency=u'USD', transaction_number=u'W630-477-8252', href=u'/debits/WD4YCKAyFrQBFYuFCUCRynOx', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WD4YCKAyFrQBFYuFCUCRynOx')
% endif