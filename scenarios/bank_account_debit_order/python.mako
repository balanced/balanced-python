% if mode == 'definition':
balanced.Order().debit_from()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-YnjW61zGxEdhpzkBcohFZ2bZhjrdtbDW')

order = balanced.Order.fetch('/orders/OR46RV9HyvE8esnGbLPkJKW4')
bank_account = balanced.BankAccount.fetch('/bank_accounts/BA1FYgj0UJZfgydhl3X65RKR')
order.debit_from(
    amount=5000,
    source=bank_account,
)
% elif mode == 'response':
Debit(status=u'pending', description=u'New description for order', links={u'customer': None, u'source': u'BA1FYgj0UJZfgydhl3X65RKR', u'dispute': None, u'order': u'OR46RV9HyvE8esnGbLPkJKW4', u'card_hold': None}, amount=5000, created_at=u'2014-11-14T00:19:23.442892Z', updated_at=u'2014-11-14T00:19:23.726157Z', failure_reason=None, currency=u'USD', transaction_number=u'W456-4OJ-WYJE', href=u'/debits/WD6k0YJIDCv2OiC6JXETZahT', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*example.com', id=u'WD6k0YJIDCv2OiC6JXETZahT')
% endif