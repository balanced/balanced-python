% if mode == 'definition':
balanced.Order()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

merchant_customer = balanced.Customer.fetch('/customers/CU1eX3FIMntmCLmi2VfWA2db')
merchant_customer.create_order(
  description='Order #12341234'
).save()
% elif mode == 'response':
Order(delivery_address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': None, u'country_code': None}, description=u'Order #12341234', links={u'merchant': u'CU1eX3FIMntmCLmi2VfWA2db'}, created_at=u'2014-04-17T22:40:10.393839Z', updated_at=u'2014-04-17T22:40:10.393841Z', currency=u'USD', amount=0, href=u'/orders/OR1MqLeXKqwqqW254i3GJ72F', meta={}, id=u'OR1MqLeXKqwqqW254i3GJ72F', amount_escrowed=0)
% endif