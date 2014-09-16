% if mode == 'definition':
balanced.BankAccount().debit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA1BPjHr0Gjc62pLAlkYCH1b')
bank_account.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(status=u'pending', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': None, u'source': u'BA1BPjHr0Gjc62pLAlkYCH1b', u'dispute': None, u'order': None, u'card_hold': None}, amount=5000, created_at=u'2014-09-02T18:24:59.115893Z', updated_at=u'2014-09-02T18:25:00.089340Z', failure_reason=None, currency=u'USD', transaction_number=u'W0KT-SJE-TDSG', href=u'/debits/WD3tMiqbzhAWHwFKTwYH7DTq', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WD3tMiqbzhAWHwFKTwYH7DTq')
% endif