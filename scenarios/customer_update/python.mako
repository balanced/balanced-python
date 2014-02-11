% if mode == 'definition':
balanced.Customer().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

customer = balanced.Debit.fetch('/customers/CU33Y4cut21qu1d1lGYDBseQ')
customer.email = 'email@newdomain.com'
customer.meta = {
  'shipping-preference': 'ground'
}
customer.save()
% elif mode == 'response':
Customer(
 'address': {u'city': None,
             u'country_code': None,
             u'line1': None,
             u'line2': None,
             u'postal_code': u'48120',
             u'state': None},
 'business_name': None,
 'created_at': u'2014-01-27T22:57:27.459187Z',
 'dob_month': 7,
 'dob_year': 1963,
 'ein': None,
 'email': u'email@newdomain.com',
 'href': u'/customers/CU33Y4cut21qu1d1lGYDBseQ',
 'id': u'CU33Y4cut21qu1d1lGYDBseQ',
 'links': {u'destination': None, u'source': None},
 'merchant_status': u'underwritten',
 'meta': {u'shipping-preference': u'ground'},
 'name': u'Henry Ford',
 'phone': None,
 'ssn_last4': None,
 'updated_at': u'2014-01-27T22:57:34.512310Z')
 
% endif