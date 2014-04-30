% if mode == 'definition':
balanced.Card().debit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

card = balanced.Card.fetch('/cards/CCIcOaBZBsK9o6Nbqmuu7B3')
card.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': None, u'source': u'CCIcOaBZBsK9o6Nbqmuu7B3', u'order': None, u'dispute': None}, amount=5000, created_at=u'2014-04-25T22:01:03.293505Z', updated_at=u'2014-04-25T22:01:04.057459Z', failure_reason=None, currency=u'USD', transaction_number=u'W417-679-7417', href=u'/debits/WDJ66VlXnDyDx5AS5uplxyt', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WDJ66VlXnDyDx5AS5uplxyt')
% endif