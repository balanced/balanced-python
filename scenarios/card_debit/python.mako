% if mode == 'definition':
balanced.Card().debit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

card = balanced.Card.fetch('/cards/CC48j1De9eVYELLivrgDeCM8')
card.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': None, u'source': u'CC48j1De9eVYELLivrgDeCM8', u'dispute': None, u'order': None, u'card_hold': u'HL4LRP1apzEYSWNEnnW4XMqc'}, amount=5000, created_at=u'2014-12-18T18:22:42.195559Z', updated_at=u'2014-12-18T18:22:42.878756Z', failure_reason=None, currency=u'USD', transaction_number=u'W8P3-G0O-CJGY', href=u'/debits/WD4LT3ghEgoGK9z4wUQCsKUU', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WD4LT3ghEgoGK9z4wUQCsKUU')
% endif