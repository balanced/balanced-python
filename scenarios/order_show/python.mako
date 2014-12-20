% if mode == 'definition':
balanced.Order.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

order = balanced.Order.fetch('/orders/OR5e6wrps4tp9QarDxWa01O5')
% elif mode == 'response':
Order(delivery_address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': None, u'country_code': None}, description=u'Order #12341234', links={u'merchant': u'CU4CZc7Xjn8gGJXl1LyzZk7S'}, created_at=u'2014-12-18T18:23:07.277803Z', updated_at=u'2014-12-18T18:23:07.277804Z', currency=u'USD', amount=0, href=u'/orders/OR5e6wrps4tp9QarDxWa01O5', meta={}, id=u'OR5e6wrps4tp9QarDxWa01O5', amount_escrowed=0)
% endif