% if mode == 'definition':
balanced.BankAccount().credit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA45anEaEr8g0lOhzhcE9VAN')
bank_account.credit(
  amount=5000
)
% elif mode == 'response':
Credit(status=u'pending', description=None, links={u'customer': u'CU3o1ZAd8Gtxz6ZTIFK9YmsM', u'destination': u'BA45anEaEr8g0lOhzhcE9VAN', u'order': None}, amount=5000, created_at=u'2015-01-09T03:25:41.350099Z', updated_at=u'2015-01-09T03:25:41.727056Z', failure_reason=None, currency=u'USD', transaction_number=u'CR6XX-6KR-7GSZ', href=u'/credits/CR6zeufmfv0u1KHrUBCQtAgU', meta={}, failure_reason_code=None, appears_on_statement_as=u'example.com', id=u'CR6zeufmfv0u1KHrUBCQtAgU')
% endif