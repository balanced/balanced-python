% if mode == 'definition':
balanced.Order()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

merchant_customer = balanced.Customer.fetch('/customers/CUxN95d3eKLokMS6CymVtIB')
merchant_customer.create_order(
  description='Order #12341234'
).save()
% elif mode == 'response':
Order(delivery_address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': None, u'country_code': None}, description=u'Order #12341234', links={u'merchant': u'CUxN95d3eKLokMS6CymVtIB'}, created_at=u'2014-04-25T22:08:49.530650Z', updated_at=u'2014-04-25T22:08:49.530653Z', currency=u'USD', amount=0, href=u'/orders/OR1oqq5PzdHGkB0GBJJiagNT', meta={}, id=u'OR1oqq5PzdHGkB0GBJJiagNT', amount_escrowed=0)
% endif