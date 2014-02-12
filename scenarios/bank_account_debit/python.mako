% if mode == 'definition':
balanced.BankAccount().debit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA1D3vL3LjasB0kewMqRGI0S')
bank_account.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': None, u'source': u'BA1D3vL3LjasB0kewMqRGI0S', u'order': None, u'dispute': None}, amount=5000, created_at=u'2014-01-27T22:56:28.702119Z', updated_at=u'2014-01-27T22:56:29.235927Z', failure_reason=None, currency=u'USD', transaction_number=u'W081-463-7557', href=u'/debits/WD1ZRRAZnFTryFdFaq7ijcPE', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WD1ZRRAZnFTryFdFaq7ijcPE')
% endif