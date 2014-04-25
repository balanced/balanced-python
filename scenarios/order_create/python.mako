% if mode == 'definition':
balanced.Order()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

merchant_customer = balanced.Customer.fetch('/customers/CU4MnFEab304anOtUtEu5hkN')
merchant_customer.create_order(
  description='Order #12341234'
).save()
% elif mode == 'response':
Order(delivery_address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': None, u'country_code': None}, description=u'Order #12341234', links={u'merchant': u'CU4MnFEab304anOtUtEu5hkN'}, created_at=u'2014-04-25T20:18:43.120760Z', updated_at=u'2014-04-25T20:18:43.120762Z', currency=u'USD', amount=0, href=u'/orders/OR6d55qbtKx5aWSURkQeodRr', meta={}, id=u'OR6d55qbtKx5aWSURkQeodRr', amount_escrowed=0)
% endif