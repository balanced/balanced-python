% if mode == 'definition':
balanced.Order().debit_from()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

order = balanced.Order.fetch('/orders/OR5QcYnwysJXQswImokq6ZSx')
card = balanced.Card.fetch('/cards/CC5OD6648yiKfSzfj6z6MdXr')
order.debit_from(
    amount='5000',
    source=card,
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Order #12341234', links={u'customer': None, u'source': u'CC5OD6648yiKfSzfj6z6MdXr', u'order': u'OR5QcYnwysJXQswImokq6ZSx', u'dispute': None}, amount=5000, created_at=u'2014-05-05T16:53:15.041569Z', updated_at=u'2014-05-05T16:53:15.911296Z', failure_reason=None, currency=u'USD', transaction_number=u'W550-229-3761', href=u'/debits/WD5QtHXAKrVhBOXjDDNCJX5b', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*example.com', id=u'WD5QtHXAKrVhBOXjDDNCJX5b')
% endif