% if mode == 'definition':
balanced.BankAccount().debit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BAcRGk40xmI8meZpNLB3oYp')
bank_account.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': None, u'source': u'BAcRGk40xmI8meZpNLB3oYp', u'order': None, u'dispute': None}, amount=5000, created_at=u'2014-04-17T22:38:59.275346Z', updated_at=u'2014-04-17T22:38:59.553856Z', failure_reason=None, currency=u'USD', transaction_number=u'W805-408-0649', href=u'/debits/WDure3wqINhVaYzrW0oclQd', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WDure3wqINhVaYzrW0oclQd')
% endif