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
Order(delivery_address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': None, u'country_code': None}, description=u'Order #12341234', links={u'merchant': u'CU3eeasZ9yQ86uzzIYZkrPGg'}, created_at=u'2014-01-27T22:58:01.115720Z', updated_at=u'2014-01-27T22:58:01.115723Z', currency=u'USD', amount=0, href=u'/orders/OR3FOihZa7lMHdAP5p8BJZVY', meta={}, id=u'OR3FOihZa7lMHdAP5p8BJZVY', amount_escrowed=0)
% endif