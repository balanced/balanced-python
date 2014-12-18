% if mode == 'definition':
balanced.Order().debit_from()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

order = balanced.Order.fetch('/orders/OR483MoeOnJEXwkxqoPdnDF3')
card = balanced.Card.fetch('/cards/CC5zxUdioIB0Dc2rjM1PK3Cw')
order.debit_from(
    amount=5000,
    source=card,
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Order #12341234', links={u'customer': None, u'source': u'CC5zxUdioIB0Dc2rjM1PK3Cw', u'dispute': None, u'order': u'OR483MoeOnJEXwkxqoPdnDF3', u'card_hold': u'HL5Sd0V9skzsm1LglischYLX'}, amount=5000, created_at=u'2014-12-17T00:38:15.489464Z', updated_at=u'2014-12-17T00:38:16.229973Z', failure_reason=None, currency=u'USD', transaction_number=u'WKJ4-LNU-03RJ', href=u'/debits/WD5SdO3j6yweD0aSWoilNR3L', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*example.com', id=u'WD5SdO3j6yweD0aSWoilNR3L')
% endif