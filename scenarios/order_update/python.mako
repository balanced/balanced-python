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
Order(delivery_address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': None, u'country_code': None}, description=u'New description for order', links={u'merchant': u'CU3eeasZ9yQ86uzzIYZkrPGg'}, created_at=u'2014-01-27T22:58:01.115720Z', updated_at=u'2014-01-27T22:58:05.657463Z', currency=u'USD', amount=0, href=u'/orders/OR3FOihZa7lMHdAP5p8BJZVY', meta={u'product.id': u'1234567890', u'anykey': u'valuegoeshere'}, id=u'OR3FOihZa7lMHdAP5p8BJZVY', amount_escrowed=0)
% endif