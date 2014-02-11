% if mode == 'definition':
balanced.Order().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

order = balanced.Order.fetch('/orders/OR3FOihZa7lMHdAP5p8BJZVY')
order.description = 'New description for order'
order.meta = {
  'anykey': 'valuegoeshere',
  'product.id': '1234567890'
}
order.save()
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
 'description': u'New description for order',
 'href': u'/orders/OR3FOihZa7lMHdAP5p8BJZVY',
 'id': u'OR3FOihZa7lMHdAP5p8BJZVY',
 'links': {u'merchant': u'CU3eeasZ9yQ86uzzIYZkrPGg'},
 'meta': {u'anykey': u'valuegoeshere', u'product.id': u'1234567890'},
 'updated_at': u'2014-01-27T22:58:05.657463Z'
})
% endif