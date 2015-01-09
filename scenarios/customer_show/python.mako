% if mode == 'definition':
balanced.Customer.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

customer = balanced.Customer.fetch('/customers/CU5aACCvYYfV6mcWJL4TEcK1')
% elif mode == 'response':
Customer(name=u'Henry Ford', links={u'source': None, u'destination': None}, created_at=u'2015-01-09T03:24:24.298841Z', dob_month=7, updated_at=u'2015-01-09T03:24:24.504781Z', phone=None, href=u'/customers/CU5aACCvYYfV6mcWJL4TEcK1', meta={}, dob_year=1963, email=None, address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': u'48120', u'country_code': None}, id=u'CU5aACCvYYfV6mcWJL4TEcK1', business_name=None, ssn_last4=None, merchant_status=u'underwritten', ein=None)
% endif