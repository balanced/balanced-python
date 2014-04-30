% if mode == 'definition':
balanced.Customer.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

customer = balanced.Customer.fetch('/customers/CUrtoxuYO4XmXZi6NzXKBLL')
% elif mode == 'response':
Customer(name=u'Henry Ford', links={u'source': None, u'destination': None}, created_at=u'2014-04-25T22:00:47.619359Z', dob_month=7, updated_at=u'2014-04-25T22:00:47.810824Z', phone=None, href=u'/customers/CUrtoxuYO4XmXZi6NzXKBLL', meta={}, dob_year=1963, email=None, address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': u'48120', u'country_code': None}, id=u'CUrtoxuYO4XmXZi6NzXKBLL', business_name=None, ssn_last4=None, merchant_status=u'underwritten', ein=None)
% endif