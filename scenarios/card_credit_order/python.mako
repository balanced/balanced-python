% if mode == 'definition':
balanced.Order().credit_to()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

order = balanced.Order.fetch('/orders/OR3vURGwVtqDnnkRS9fgH41G')
card = balanced.Card.fetch('/cards/CC4HDcgvzIltvwv6GSjBVbji')
order.credit_to(
    amount=5000,
    source=card,
)
% elif mode == 'response':
Credit(status=u'succeeded', description=u'Order #12341234', links={u'customer': u'CU3o1ZAd8Gtxz6ZTIFK9YmsM', u'destination': u'CC4HDcgvzIltvwv6GSjBVbji', u'order': u'OR3vURGwVtqDnnkRS9fgH41G'}, amount=5000, created_at=u'2015-01-09T03:24:02.493888Z', updated_at=u'2015-01-09T03:24:02.893852Z', failure_reason=None, currency=u'USD', transaction_number=u'CROCY-7EY-ZRI2', href=u'/credits/CR4M2HpYdKDcG8nh4d5HrKJL', meta={}, failure_reason_code=None, appears_on_statement_as=u'example.com', id=u'CR4M2HpYdKDcG8nh4d5HrKJL')
% endif