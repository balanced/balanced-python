% if mode == 'definition':
balanced.Card().credit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

card = balanced.Card.fetch('/cards/CC5uc1B6fJPQBSJUi0m58tal')
card.credit(
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Credit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': None, u'destination': u'CC5uc1B6fJPQBSJUi0m58tal', u'order': None}, amount=5000, created_at=u'2014-09-02T18:26:50.236855Z', updated_at=u'2014-09-02T18:26:52.375308Z', failure_reason=None, currency=u'USD', transaction_number=u'CRPMG-R6D-1BDZ', href=u'/credits/CR5uKYvRhvGBNiMQuXKBcl0Y', meta={}, failure_reason_code=None, appears_on_statement_as=u'example.com', id=u'CR5uKYvRhvGBNiMQuXKBcl0Y')
% endif