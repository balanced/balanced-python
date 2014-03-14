% if mode == 'definition':
balanced.BankAccount().debit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA50LpPrCTB63Ecm0wEgdOQM')
bank_account.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': None, u'source': u'BA50LpPrCTB63Ecm0wEgdOQM', u'order': None, u'dispute': None}, amount=5000, created_at=u'2014-03-06T19:22:35.961050Z', updated_at=u'2014-03-06T19:22:36.418154Z', failure_reason=None, currency=u'USD', transaction_number=u'W051-293-0823', href=u'/debits/WD5qunOPeKdCnWXIg9EHyHge', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WD5qunOPeKdCnWXIg9EHyHge')
% endif