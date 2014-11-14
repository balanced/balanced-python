% if mode == 'definition':
balanced.BankAccount().credit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA2gul8YMjFWnFk0fFHXwX6g')
bank_account.credit(
  amount=5000
)
% elif mode == 'response':
Credit(status=u'pending', description=None, links={u'customer': u'CU2718cI8PkMdFyPjboZLZfn', u'destination': u'BA2gul8YMjFWnFk0fFHXwX6g', u'order': None}, amount=5000, created_at=u'2014-11-14T19:31:16.741168Z', updated_at=u'2014-11-14T19:31:17.234505Z', failure_reason=None, currency=u'USD', transaction_number=u'CRZ2P-NW9-NTU2', href=u'/credits/CR5DQV6PdifnxDMmethpLIGN', meta={}, failure_reason_code=None, appears_on_statement_as=u'example.com', id=u'CR5DQV6PdifnxDMmethpLIGN')
% endif