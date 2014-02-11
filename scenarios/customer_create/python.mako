% if mode == 'definition':
balanced.Customer().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

customer = balanced.Customer(
    dob_year=1963,
    dob_month=7,
    name='Henry Ford',
    address={
        'postal_code': '48120'
    }
).save()
% elif mode == 'response':
Customer(
 'address': {u'city': None,
             u'country_code': None,
             u'line1': None,
             u'line2': None,
             u'postal_code': u'48120',
             u'state': None},
 'business_name': None,
 'created_at': u'2014-01-27T22:57:36.586782Z',
 'dob_month': 7,
 'dob_year': 1963,
 'ein': None,
 'email': None,
 'href': u'/customers/CU3eeasZ9yQ86uzzIYZkrPGg',
 'id': u'CU3eeasZ9yQ86uzzIYZkrPGg',
 'links': {u'destination': None, u'source': None},
 'merchant_status': u'underwritten',
 'meta': {},
 'name': u'Henry Ford',
 'phone': None,
 'ssn_last4': None,
 'updated_at': u'2014-01-27T22:57:37.740442Z')
 
% endif