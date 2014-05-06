% if mode == 'definition':
balanced.Card().debit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

card = balanced.Card.fetch('/cards/CCf1fF6z2RjwvniinUVefhb')
card.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': u'CU7yCmXG2RxyyIkcHG3SIMUF', u'source': u'CCf1fF6z2RjwvniinUVefhb', u'order': None, u'dispute': None}, amount=5000, created_at=u'2014-04-25T22:00:58.990911Z', updated_at=u'2014-04-25T22:00:59.631219Z', failure_reason=None, currency=u'USD', transaction_number=u'W359-587-1632', href=u'/debits/WDEg9ofx83CeAhiwI1QmA17', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WDEg9ofx83CeAhiwI1QmA17')
% endif