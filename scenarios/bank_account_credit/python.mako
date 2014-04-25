% if mode == 'definition':
balanced.BankAccount().credit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA3Y63fK5STwlhKNMkE3Utmd')
bank_account.credit(
  amount=5000
)
% elif mode == 'response':
Credit(status=u'succeeded', description=None, links={u'customer': u'CU3VYCUIfwngJsidJWdGw2W5', u'destination': u'BA3Y63fK5STwlhKNMkE3Utmd', u'order': None}, amount=5000, created_at=u'2014-04-25T20:18:52.480929Z', updated_at=u'2014-04-25T20:18:54.380146Z', failure_reason=None, currency=u'USD', transaction_number=u'CR666-481-5204', href=u'/credits/CR6nBcaGvGc4dtflEB1bjKBP', meta={}, failure_reason_code=None, appears_on_statement_as=u'example.com', id=u'CR6nBcaGvGc4dtflEB1bjKBP')
% endif