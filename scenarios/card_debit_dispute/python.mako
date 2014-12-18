% if mode == 'definition':
balanced.Card().debit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

card = balanced.Card.fetch('/cards/CC6NqHMgvYPDq4zOrvsZceJO')
card.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': None, u'source': u'CC6NqHMgvYPDq4zOrvsZceJO', u'dispute': None, u'order': None, u'card_hold': u'HL6NXjsQRz4WyaxCIojECnVH'}, amount=5000, created_at=u'2014-12-17T00:39:06.826185Z', updated_at=u'2014-12-17T00:39:07.661749Z', failure_reason=None, currency=u'USD', transaction_number=u'W3A5-IA0-BUY1', href=u'/debits/WD6NY7W6uBFngNyBLqyhPBPv', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WD6NY7W6uBFngNyBLqyhPBPv')
% endif