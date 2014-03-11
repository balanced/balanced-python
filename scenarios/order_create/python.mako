% if mode == 'definition':
balanced.Order()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

merchant_customer = balanced.Customer.fetch('/customers/CU64R7DS6DwuXYVg9RTskFK8')
merchant_customer.create_order(
  description='Order #12341234'
).save()
% elif mode == 'response':
Order(delivery_address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': None, u'country_code': None}, description=u'Order #12341234', links={u'merchant': u'CU64R7DS6DwuXYVg9RTskFK8'}, created_at=u'2014-03-06T19:23:39.207291Z', updated_at=u'2014-03-06T19:23:39.207294Z', currency=u'USD', amount=0, href=u'/orders/OR6wcEVkOymvs4PairiGEcIx', meta={}, id=u'OR6wcEVkOymvs4PairiGEcIx', amount_escrowed=0)
% endif