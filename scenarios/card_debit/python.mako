% if mode == 'definition':
balanced.Card().debit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

card = balanced.Card.fetch('/cards/CC68IoCVpoFlkugB7xt52p8C')
card.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': u'CU64R7DS6DwuXYVg9RTskFK8', u'source': u'CC68IoCVpoFlkugB7xt52p8C', u'order': None, u'dispute': None}, amount=5000, created_at=u'2014-03-06T19:23:44.148512Z', updated_at=u'2014-03-06T19:23:45.554127Z', failure_reason=None, currency=u'USD', transaction_number=u'W274-713-3734', href=u'/debits/WD6BKYhbRzlRhfKSE1DcpqS5', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WD6BKYhbRzlRhfKSE1DcpqS5')
% endif