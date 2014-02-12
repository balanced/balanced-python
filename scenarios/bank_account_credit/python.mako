% if mode == 'definition':
balanced.BankAccount().credit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA3qNbYRqFM0Q7MXn3IcjGl0')
bank_account.credit(
  amount=5000
)
% elif mode == 'response':
Credit(status=u'succeeded', description=None, links={u'customer': u'CU3eeasZ9yQ86uzzIYZkrPGg', u'destination': u'BA3qNbYRqFM0Q7MXn3IcjGl0', u'order': None}, amount=5000, created_at=u'2014-01-27T22:58:19.422292Z', updated_at=u'2014-01-27T22:58:20.346871Z', failure_reason=None, currency=u'USD', transaction_number=u'CR816-868-3666', href=u'/credits/CR40neytmVG2HDBp1opfF7sY', meta={}, failure_reason_code=None, appears_on_statement_as=u'example.com', id=u'CR40neytmVG2HDBp1opfF7sY')
% endif