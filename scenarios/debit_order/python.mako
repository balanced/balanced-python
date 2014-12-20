% if mode == 'definition':
balanced.Order().debit_from()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

order = balanced.Order.fetch('/orders/OR2JfBYxYlDAF3L48u9DtIEU')
card = balanced.Card.fetch('/cards/CC48j1De9eVYELLivrgDeCM8')
order.debit_from(
    amount=5000,
    source=card,
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Order #12341234', links={u'customer': None, u'source': u'CC48j1De9eVYELLivrgDeCM8', u'dispute': None, u'order': u'OR2JfBYxYlDAF3L48u9DtIEU', u'card_hold': u'HL4icG3nKxolIaqbhvFrBFgp'}, amount=5000, created_at=u'2014-12-18T18:22:15.820449Z', updated_at=u'2014-12-18T18:22:16.471734Z', failure_reason=None, currency=u'USD', transaction_number=u'WEX2-E7W-CK3J', href=u'/debits/WD4idxjgcIMm3rMMzopJjK3X', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*example.com', id=u'WD4idxjgcIMm3rMMzopJjK3X')
% endif