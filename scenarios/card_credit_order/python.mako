% if mode == 'definition':
balanced.Order().credit_to()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

order = balanced.Order.fetch('/orders/OR2JfBYxYlDAF3L48u9DtIEU')
card = balanced.Card.fetch('/cards/CC4fWSr1PpCAh6mlDzNfr0Gs')
order.credit_to(
    amount=5000,
    source=card,
)
% elif mode == 'response':
Credit(status=u'succeeded', description=u'Order #12341234', links={u'customer': u'CU2DRnwOXfbxBlKb5CUWwWJi', u'destination': u'CC4fWSr1PpCAh6mlDzNfr0Gs', u'order': u'OR2JfBYxYlDAF3L48u9DtIEU'}, amount=5000, created_at=u'2014-12-18T18:22:17.797221Z', updated_at=u'2014-12-18T18:22:18.204253Z', failure_reason=None, currency=u'USD', transaction_number=u'CRR6E-4XF-2GH9', href=u'/credits/CR4kroVx1o71Jz6177919e1y', meta={}, failure_reason_code=None, appears_on_statement_as=u'example.com', id=u'CR4kroVx1o71Jz6177919e1y')
% endif