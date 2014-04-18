% if mode == 'definition':
balanced.Card().debit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

card = balanced.Card.fetch('/cards/CC1dQyiZY6h896UfGpBAWXOJ')
card.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': None, u'source': u'CC1dQyiZY6h896UfGpBAWXOJ', u'order': None, u'dispute': None}, amount=5000, created_at=u'2014-04-17T22:39:51.088029Z', updated_at=u'2014-04-17T22:39:52.100741Z', failure_reason=None, currency=u'USD', transaction_number=u'W303-837-3548', href=u'/debits/WD1qIcVqGE1JrqFJuHH0d1pf', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WD1qIcVqGE1JrqFJuHH0d1pf')
% endif