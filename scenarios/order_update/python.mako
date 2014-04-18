% if mode == 'definition':
balanced.Order().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

order = balanced.Order.fetch('/orders/OR1MqLeXKqwqqW254i3GJ72F')
order.description = 'New description for order'
order.meta = {
  'anykey': 'valuegoeshere',
  'product.id': '1234567890'
}
order.save()
% elif mode == 'response':
Order(delivery_address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': None, u'country_code': None}, description=u'New description for order', links={u'merchant': u'CU1eX3FIMntmCLmi2VfWA2db'}, created_at=u'2014-04-17T22:40:10.393839Z', updated_at=u'2014-04-17T22:40:13.722216Z', currency=u'USD', amount=0, href=u'/orders/OR1MqLeXKqwqqW254i3GJ72F', meta={u'product.id': u'1234567890', u'anykey': u'valuegoeshere'}, id=u'OR1MqLeXKqwqqW254i3GJ72F', amount_escrowed=0)
% endif