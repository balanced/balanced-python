% if mode == 'definition':
balanced.BankAccount().credit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA7zu6QXmylsn0o6qVpS8UO9')
bank_account.credit(
  amount=5000
)
% elif mode == 'response':
Credit(status=u'succeeded', description=None, links={u'customer': u'CU7yCmXG2RxyyIkcHG3SIMUF', u'destination': u'BA7zu6QXmylsn0o6qVpS8UO9', u'order': None}, amount=5000, created_at=u'2014-04-25T22:08:58.386422Z', updated_at=u'2014-04-25T22:08:58.659857Z', failure_reason=None, currency=u'USD', transaction_number=u'CR964-486-9546', href=u'/credits/CR1ynmPUlJGbV9EMyqkowHJP', meta={}, failure_reason_code=None, appears_on_statement_as=u'example.com', id=u'CR1ynmPUlJGbV9EMyqkowHJP')
% endif