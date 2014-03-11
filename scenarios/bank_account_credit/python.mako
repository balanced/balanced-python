% if mode == 'definition':
balanced.BankAccount().credit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA6bLGpQZPOiTNRxF24rMd9m')
bank_account.credit(
  amount=5000
)
% elif mode == 'response':
Credit(status=u'succeeded', description=None, links={u'customer': u'CU64R7DS6DwuXYVg9RTskFK8', u'destination': u'BA6bLGpQZPOiTNRxF24rMd9m', u'order': None}, amount=5000, created_at=u'2014-03-06T19:23:54.514782Z', updated_at=u'2014-03-06T19:23:55.019500Z', failure_reason=None, currency=u'USD', transaction_number=u'CR855-415-1670', href=u'/credits/CR6NpuEtezCdLTYngDrSEODv', meta={}, failure_reason_code=None, appears_on_statement_as=u'example.com', id=u'CR6NpuEtezCdLTYngDrSEODv')
% endif