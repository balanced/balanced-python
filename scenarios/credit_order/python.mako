% if mode == 'definition':
balanced.Order().credit_to()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

order = balanced.Order.fetch('/orders/OR5QcYnwysJXQswImokq6ZSx')
bank_account = balanced.BankAccount.fetch('/bank_accounts/BA5KLH6jhFgtVENHXOcF3Cfj/credits')
order.credit_to(
    amount='5000',
    destination=bank_account
)
% elif mode == 'response':
Credit(status=u'succeeded', description=u'Order #12341234', links={u'customer': u'CU5KEQ3tk6RIfIgRg3x5ZQ1L', u'destination': u'BA5KLH6jhFgtVENHXOcF3Cfj', u'order': u'OR5QcYnwysJXQswImokq6ZSx'}, amount=5000, created_at=u'2014-05-05T16:53:39.219476Z', updated_at=u'2014-05-05T16:53:39.441985Z', failure_reason=None, currency=u'USD', transaction_number=u'CR401-971-8594', href=u'/credits/CR6hFW7Z5Rx79OVfB22BJLjr', meta={}, failure_reason_code=None, appears_on_statement_as=u'example.com', id=u'CR6hFW7Z5Rx79OVfB22BJLjr')
% endif