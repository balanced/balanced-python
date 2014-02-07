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
{u'name': u'Henry Ford', u'links': {u'source': None, u'destination': None}, u'updated_at': u'2014-01-27T22:57:37.740442Z', u'created_at': u'2014-01-27T22:57:36.586782Z', u'dob_month': 7, u'merchant_status': u'underwritten', u'id': u'CU3eeasZ9yQ86uzzIYZkrPGg', u'phone': None, u'href': u'/customers/CU3eeasZ9yQ86uzzIYZkrPGg', u'meta': {}, u'dob_year': 1963, u'address': {u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': u'48120', u'country_code': None}, u'business_name': None, u'ssn_last4': None, u'email': None, u'ein': None}
% endif