% if mode == 'definition':
balanced.Order().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

order = balanced.Order.fetch('/orders/OR1oqq5PzdHGkB0GBJJiagNT')
order.description = 'New description for order'
order.meta = {
  'anykey': 'valuegoeshere',
  'product.id': '1234567890'
}
order.save()
% elif mode == 'response':
Order(delivery_address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': None, u'country_code': None}, description=u'New description for order', links={u'merchant': u'CUxN95d3eKLokMS6CymVtIB'}, created_at=u'2014-04-25T22:08:49.530650Z', updated_at=u'2014-04-25T22:08:53.050504Z', currency=u'USD', amount=0, href=u'/orders/OR1oqq5PzdHGkB0GBJJiagNT', meta={u'product.id': u'1234567890', u'anykey': u'valuegoeshere'}, id=u'OR1oqq5PzdHGkB0GBJJiagNT', amount_escrowed=0)
% endif