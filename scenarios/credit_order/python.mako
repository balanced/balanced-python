% if mode == 'definition':
balanced.Order().credit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

order = balanced.Order.fetch('/orders/OR1s2WQKp0shLH9Qb0LiUfEJ')
bank_account = balanced.BankAccount.fetch('/bank_accounts/BA1BnM6LmT9DLV4bZDIjUmHD')
order.credit_to(
    amount='5000',
    destination=bank_account
)
% elif mode == 'response':
Credit(status=u'succeeded', description=u'Order #12341234', links={u'customer': u'CU1rvfqiY1AtduFioI0rWJvL', u'destination': u'BA1BnM6LmT9DLV4bZDIjUmHD', u'order': u'OR1s2WQKp0shLH9Qb0LiUfEJ'}, amount=5000, created_at=u'2014-04-30T04:52:18.377513Z', updated_at=u'2014-04-30T04:52:18.594666Z', failure_reason=None, currency=u'USD', transaction_number=u'CR715-275-6943', href=u'/credits/CR1C6rJsYzhOhCtxZkheExEh', meta={}, failure_reason_code=None, appears_on_statement_as=u'example.com', id=u'CR1C6rJsYzhOhCtxZkheExEh')
% endif