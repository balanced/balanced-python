% if mode == 'definition':
balanced.Card().debit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

card = balanced.Card.fetch('/cards/CC4PUCBUQfNqecW8QDsjnOfz')
card.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': None, u'source': u'CC4PUCBUQfNqecW8QDsjnOfz', u'dispute': None, u'order': None, u'card_hold': u'HL4QCbGmW3oDABqXFLQI5yi9'}, amount=5000, created_at=u'2014-12-18T18:22:46.432674Z', updated_at=u'2014-12-18T18:22:47.274383Z', failure_reason=None, currency=u'USD', transaction_number=u'WQM2-IOR-S6S0', href=u'/debits/WD4QE0i532v0eWQ6mCWCASc5', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WD4QE0i532v0eWQ6mCWCASc5')
% endif