% if mode == 'definition':
balanced.Order().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

order = balanced.Order.fetch('/orders/OR5e6wrps4tp9QarDxWa01O5')
order.description = 'New description for order'
order.meta = {
  'anykey': 'valuegoeshere',
  'product.id': '1234567890'
}
order.save()
% elif mode == 'response':
Order(delivery_address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': None, u'country_code': None}, description=u'New description for order', links={u'merchant': u'CU4CZc7Xjn8gGJXl1LyzZk7S'}, created_at=u'2014-12-18T18:23:07.277803Z', updated_at=u'2014-12-18T18:23:11.123898Z', currency=u'USD', amount=0, href=u'/orders/OR5e6wrps4tp9QarDxWa01O5', meta={u'product.id': u'1234567890', u'anykey': u'valuegoeshere'}, id=u'OR5e6wrps4tp9QarDxWa01O5', amount_escrowed=0)
% endif