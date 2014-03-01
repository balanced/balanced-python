% if mode == 'definition':
balanced.Customer.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

customer = balanced.Customer.fetch('/customers/CU33Y4cut21qu1d1lGYDBseQ')
% elif mode == 'response':
Customer(name=u'Henry Ford', links={u'source': None, u'destination': None}, created_at=u'2014-01-27T22:57:27.459187Z', dob_month=7, updated_at=u'2014-01-27T22:57:29.488272Z', phone=None, href=u'/customers/CU33Y4cut21qu1d1lGYDBseQ', meta={}, dob_year=1963, email=None, address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': u'48120', u'country_code': None}, id=u'CU33Y4cut21qu1d1lGYDBseQ', business_name=None, ssn_last4=None, merchant_status=u'underwritten', ein=None)
% endif