% if mode == 'definition':
balanced.Order().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

order = balanced.Order.fetch('/orders/OR6wcEVkOymvs4PairiGEcIx')
order.description = 'New description for order'
order.meta = {
  'anykey': 'valuegoeshere',
  'product.id': '1234567890'
}
order.save()
% elif mode == 'response':
Order(delivery_address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': None, u'country_code': None}, description=u'New description for order', links={u'merchant': u'CU64R7DS6DwuXYVg9RTskFK8'}, created_at=u'2014-03-06T19:23:39.207291Z', updated_at=u'2014-03-06T19:23:42.673919Z', currency=u'USD', amount=0, href=u'/orders/OR6wcEVkOymvs4PairiGEcIx', meta={u'product.id': u'1234567890', u'anykey': u'valuegoeshere'}, id=u'OR6wcEVkOymvs4PairiGEcIx', amount_escrowed=0)
% endif