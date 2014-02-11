% if mode == 'definition':
balanced.Order()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

merchant_customer = balanced.Customer.fetch('/customers/CU3eeasZ9yQ86uzzIYZkrPGg')
merchant_customer.create_order(
  description='Order #12341234'
).save()
% elif mode == 'response':
Order(**{
 'amount': 0,
 'amount_escrowed': 0,
 'created_at': u'2014-01-27T22:58:01.115720Z',
 'currency': u'USD',
 'delivery_address': {u'city': None,
                      u'country_code': None,
                      u'line1': None,
                      u'line2': None,
                      u'postal_code': None,
                      u'state': None},
 'description': u'Order #12341234',
 'href': u'/orders/OR3FOihZa7lMHdAP5p8BJZVY',
 'id': u'OR3FOihZa7lMHdAP5p8BJZVY',
 'links': {u'merchant': u'CU3eeasZ9yQ86uzzIYZkrPGg'},
 'meta': {},
 'updated_at': u'2014-01-27T22:58:01.115723Z'
})
% endif