% if mode == 'definition':
balanced.Order().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

order = balanced.Order.fetch('/orders/OR6nHTLOYehaSU5SoxqQE5WB')
order.description = 'New description for order'
order.meta = {
  'anykey': 'valuegoeshere',
  'product.id': '1234567890'
}
order.save()
% elif mode == 'response':
Order(delivery_address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': None, u'country_code': None}, description=u'New description for order', links={u'merchant': u'CU5AxbQrjAcjsbquafnvwaas'}, created_at=u'2015-01-09T03:25:31.087736Z', updated_at=u'2015-01-09T03:25:34.898356Z', currency=u'USD', amount=0, href=u'/orders/OR6nHTLOYehaSU5SoxqQE5WB', meta={u'product.id': u'1234567890', u'anykey': u'valuegoeshere'}, id=u'OR6nHTLOYehaSU5SoxqQE5WB', amount_escrowed=0)
% endif