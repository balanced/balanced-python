% if mode == 'definition':
balanced.Card().credit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2jJSjIixy2qkOMmIONPtXnawOUftBDRSK')

card = balanced.Card.fetch('/cards/CC7nMc4BAti7DgvWmpGV5e6N')
card.credit(
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Credit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': None, u'destination': u'CC7nMc4BAti7DgvWmpGV5e6N', u'order': None}, amount=5000, created_at=u'2014-05-19T20:27:07.904059Z', updated_at=u'2014-05-19T20:27:08.244392Z', failure_reason=None, currency=u'USD', transaction_number=u'CR018-897-7930', href=u'/credits/CR7oh5wk2EfSuMu34r2YzT0l', meta={}, failure_reason_code=None, appears_on_statement_as=u'example.com', id=u'CR7oh5wk2EfSuMu34r2YzT0l')
% endif