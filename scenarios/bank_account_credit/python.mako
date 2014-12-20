% if mode == 'definition':
balanced.BankAccount().credit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA3uzbngfVXy1SGg25Et7iKY')
bank_account.credit(
  amount=5000
)
% elif mode == 'response':
Credit(status=u'pending', description=None, links={u'customer': u'CU2DRnwOXfbxBlKb5CUWwWJi', u'destination': u'BA3uzbngfVXy1SGg25Et7iKY', u'order': None}, amount=5000, created_at=u'2014-12-18T18:23:17.134381Z', updated_at=u'2014-12-18T18:23:17.459321Z', failure_reason=None, currency=u'USD', transaction_number=u'CRMY6-6AZ-YV3J', href=u'/credits/CR5pb9ux8RYVNTwcJ3jdVF84', meta={}, failure_reason_code=None, appears_on_statement_as=u'example.com', id=u'CR5pb9ux8RYVNTwcJ3jdVF84')
% endif