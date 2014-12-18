% if mode == 'definition':
balanced.Order().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

order = balanced.Order.fetch('/orders/OR1ugPYIQ94wAaS439i25QVL')
order.description = 'New description for order'
order.meta = {
  'anykey': 'valuegoeshere',
  'product.id': '1234567890'
}
order.save()
% elif mode == 'response':
Order(delivery_address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': None, u'country_code': None}, description=u'New description for order', links={u'merchant': u'CU6sIkS1KUtHVoPUBM1Gf72B'}, created_at=u'2014-12-17T00:41:23.181803Z', updated_at=u'2014-12-17T00:41:30.733809Z', currency=u'USD', amount=0, href=u'/orders/OR1ugPYIQ94wAaS439i25QVL', meta={u'product.id': u'1234567890', u'anykey': u'valuegoeshere'}, id=u'OR1ugPYIQ94wAaS439i25QVL', amount_escrowed=0)
% endif