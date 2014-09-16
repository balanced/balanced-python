% if mode == 'definition':
balanced.BankAccount().credit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA3bgtBxC3q4N9QvlN2jqFnL')
bank_account.credit(
  amount=5000
)
% elif mode == 'response':
Credit(status=u'pending', description=None, links={u'customer': u'CU36bqPshRNopkLNM6qBmn5e', u'destination': u'BA3bgtBxC3q4N9QvlN2jqFnL', u'order': None}, amount=5000, created_at=u'2014-09-02T18:28:47.307588Z', updated_at=u'2014-09-02T18:28:47.915602Z', failure_reason=None, currency=u'USD', transaction_number=u'CR3I1-TR1-JKT6', href=u'/credits/CR7CqCpjWl6O9BjxrQVOFi48', meta={}, failure_reason_code=None, appears_on_statement_as=u'example.com', id=u'CR7CqCpjWl6O9BjxrQVOFi48')
% endif