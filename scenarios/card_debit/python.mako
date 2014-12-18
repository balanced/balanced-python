% if mode == 'definition':
balanced.Card().debit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

card = balanced.Card.fetch('/cards/CC5zxUdioIB0Dc2rjM1PK3Cw')
card.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': None, u'source': u'CC5zxUdioIB0Dc2rjM1PK3Cw', u'dispute': None, u'order': None, u'card_hold': u'HL6GXbGLBKjI5enx0SZEm37i'}, amount=5000, created_at=u'2014-12-17T00:39:00.612523Z', updated_at=u'2014-12-17T00:39:01.290623Z', failure_reason=None, currency=u'USD', transaction_number=u'W7B3-LI7-IJ9V', href=u'/debits/WD6GYJu1hYxqJrpXspjFtKSI', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WD6GYJu1hYxqJrpXspjFtKSI')
% endif