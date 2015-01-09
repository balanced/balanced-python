% if mode == 'definition':
balanced.Order().debit_from()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

order = balanced.Order.fetch('/orders/OR3vURGwVtqDnnkRS9fgH41G')
bank_account = balanced.BankAccount.fetch('/bank_accounts/BA3LVXVgJLrzkmB3vUntKJ6t')
order.debit_from(
    amount=5000,
    source=bank_account,
)
% elif mode == 'response':
Debit(status=u'pending', description=u'Order #12341234', links={u'customer': None, u'source': u'BA3LVXVgJLrzkmB3vUntKJ6t', u'dispute': None, u'order': u'OR3vURGwVtqDnnkRS9fgH41G', u'card_hold': None}, amount=5000, created_at=u'2015-01-09T03:23:26.676705Z', updated_at=u'2015-01-09T03:23:26.949357Z', failure_reason=None, currency=u'USD', transaction_number=u'WULC-EFN-JTW0', href=u'/debits/WD47MlpITdspMYF3lZSxmGtT', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*example.com', id=u'WD47MlpITdspMYF3lZSxmGtT')
% endif