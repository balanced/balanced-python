% if mode == 'definition':
balanced.Order()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

merchant_customer = balanced.Customer.fetch('/customers/CU5AxbQrjAcjsbquafnvwaas')
merchant_customer.create_order(
  description='Order #12341234'
).save()
% elif mode == 'response':
Order(delivery_address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': None, u'country_code': None}, description=u'Order #12341234', links={u'merchant': u'CU5AxbQrjAcjsbquafnvwaas'}, created_at=u'2015-01-09T03:25:31.087736Z', updated_at=u'2015-01-09T03:25:31.087737Z', currency=u'USD', amount=0, href=u'/orders/OR6nHTLOYehaSU5SoxqQE5WB', meta={}, id=u'OR6nHTLOYehaSU5SoxqQE5WB', amount_escrowed=0)
% endif