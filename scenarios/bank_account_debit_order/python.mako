% if mode == 'definition':
balanced.Order().debit_from()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

order = balanced.Order.fetch('/orders/OR2JfBYxYlDAF3L48u9DtIEU')
bank_account = balanced.BankAccount.fetch('/bank_accounts/BA305R4Vwumo1KjT9kwVrdfT')
order.debit_from(
    amount=5000,
    source=bank_account,
)
% elif mode == 'response':
Debit(status=u'pending', description=u'Order #12341234', links={u'customer': None, u'source': u'BA305R4Vwumo1KjT9kwVrdfT', u'dispute': None, u'order': u'OR2JfBYxYlDAF3L48u9DtIEU', u'card_hold': None}, amount=5000, created_at=u'2014-12-18T18:21:34.869249Z', updated_at=u'2014-12-18T18:21:35.142979Z', failure_reason=None, currency=u'USD', transaction_number=u'WQUD-1BL-3KIM', href=u'/debits/WD3yawZGsngL3dLqW0YpEEcE', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*example.com', id=u'WD3yawZGsngL3dLqW0YpEEcE')
% endif