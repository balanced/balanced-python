% if mode == 'definition':
balanced.Order().debit_from()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

order = balanced.Order.fetch('/orders/OR5sl2RJVnbwEf45nq5eATdz')
bank_account = balanced.BankAccount.fetch('/bank_accounts/BA17zYxBNrmg9isvicjz9Ae4')
order.debit_from(
    amount=5000,
    source=bank_account,
)
% elif mode == 'response':
Debit(status=u'pending', description=u'New description for order', links={u'customer': None, u'source': u'BA17zYxBNrmg9isvicjz9Ae4', u'dispute': None, u'order': u'OR5sl2RJVnbwEf45nq5eATdz', u'card_hold': None}, amount=5000, created_at=u'2014-11-14T19:32:12.424415Z', updated_at=u'2014-11-14T19:32:12.989360Z', failure_reason=None, currency=u'USD', transaction_number=u'W5OI-0K3-GLCQ', href=u'/debits/WD6EB5Jvfr4PTxUJB3HFTGVn', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*example.com', id=u'WD6EB5Jvfr4PTxUJB3HFTGVn')
% endif