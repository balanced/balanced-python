% if mode == 'definition':
balanced.Customer.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

customer = balanced.Customer.fetch('/customers/CU4wBFaFMi043nnBgRNrgTXa')
% elif mode == 'response':
Customer(name=u'Henry Ford', links={u'source': None, u'destination': None}, created_at=u'2014-12-18T18:22:28.601538Z', dob_month=7, updated_at=u'2014-12-18T18:22:28.847829Z', phone=None, href=u'/customers/CU4wBFaFMi043nnBgRNrgTXa', meta={}, dob_year=1963, email=None, address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': u'48120', u'country_code': None}, id=u'CU4wBFaFMi043nnBgRNrgTXa', business_name=None, ssn_last4=None, merchant_status=u'underwritten', ein=None)
% endif