% if mode == 'definition':
balanced.BankAccount().debit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA7lb2roygfhwDfbvikDLcHP')
bank_account.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': None, u'source': u'BA7lb2roygfhwDfbvikDLcHP', u'order': None, u'dispute': None}, amount=5000, created_at=u'2014-04-25T22:00:13.215147Z', updated_at=u'2014-04-25T22:00:13.474988Z', failure_reason=None, currency=u'USD', transaction_number=u'W037-237-6091', href=u'/debits/WD7BQhTIsYYSdWYr3QkpTSml', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WD7BQhTIsYYSdWYr3QkpTSml')
% endif