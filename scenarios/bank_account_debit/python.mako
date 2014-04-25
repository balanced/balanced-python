% if mode == 'definition':
balanced.BankAccount().debit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA3IhKG3bIN22cLHbaOIGtHb')
bank_account.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': None, u'source': u'BA3IhKG3bIN22cLHbaOIGtHb', u'order': None, u'dispute': None}, amount=5000, created_at=u'2014-04-25T20:09:33.925749Z', updated_at=u'2014-04-25T20:09:34.551675Z', failure_reason=None, currency=u'USD', transaction_number=u'W212-186-3238', href=u'/debits/WD42s4BBkPXvzXTxyo7CLfFj', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WD42s4BBkPXvzXTxyo7CLfFj')
% endif