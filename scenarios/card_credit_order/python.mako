% if mode == 'definition':
balanced.Order().credit_to()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

order = balanced.Order.fetch('/orders/OR2UWXCNY2nKlqIQhQhWN3Jm')
card = balanced.Card.fetch('/cards/CC3IBNr3erYpVuuZDyWNFfet')
order.credit_to(
    amount=5000,
    source=card,
)
% elif mode == 'response':
Credit(status=u'succeeded', description=u'Order #12341234', links={u'customer': u'CU40AyvBB6ny9u3oelCwyc3C', u'destination': u'CC3IBNr3erYpVuuZDyWNFfet', u'order': u'OR2UWXCNY2nKlqIQhQhWN3Jm'}, amount=5000, created_at=u'2014-11-14T19:37:03.073567Z', updated_at=u'2014-11-14T19:37:04.037697Z', failure_reason=None, currency=u'USD', transaction_number=u'CR5YQ-F7A-Q1HF', href=u'/credits/CR48hJDhdGMcI2vvJyzUbG8w', meta={}, failure_reason_code=None, appears_on_statement_as=u'example.com', id=u'CR48hJDhdGMcI2vvJyzUbG8w')
% endif