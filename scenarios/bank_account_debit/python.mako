% if mode == 'definition':
balanced.BankAccount().debit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA17zYxBNrmg9isvicjz9Ae4')
bank_account.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(status=u'pending', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': None, u'source': u'BA17zYxBNrmg9isvicjz9Ae4', u'dispute': None, u'order': None, u'card_hold': None}, amount=5000, created_at=u'2014-11-14T19:28:20.531858Z', updated_at=u'2014-11-14T19:28:20.985200Z', failure_reason=None, currency=u'USD', transaction_number=u'WSVJ-8FD-G2UK', href=u'/debits/WD2rNbc5IxoDIyiumypsUMtv', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WD2rNbc5IxoDIyiumypsUMtv')
% endif