% if mode == 'definition':
balanced.BankAccount().credit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA4UZsYXpf2BX97v5WPaT57O')
bank_account.credit(
  amount=5000
)
% elif mode == 'response':
Credit(status=u'pending', description=None, links={u'customer': u'CU42QGL6X08UHbQnRqgCNtKg', u'destination': u'BA4UZsYXpf2BX97v5WPaT57O', u'order': None}, amount=5000, created_at=u'2014-12-18T22:01:01.124567Z', updated_at=u'2014-12-18T22:01:01.453779Z', failure_reason=None, currency=u'USD', transaction_number=u'CRPNY-QIO-LQPD', href=u'/credits/CRRbC5ykVZmhoTfpZq6gy2s', meta={}, failure_reason_code=None, appears_on_statement_as=u'example.com', id=u'CRRbC5ykVZmhoTfpZq6gy2s')
% endif