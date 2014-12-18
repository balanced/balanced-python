% if mode == 'definition':
balanced.Customer().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

customer = balanced.Customer(
    dob_year=1963,
    dob_month=7,
    name='Henry Ford',
    address={
        'postal_code': '48120'
    }
).save()
% elif mode == 'response':
Customer(name=u'Henry Ford', links={u'source': None, u'destination': None}, created_at=u'2014-12-17T00:38:47.920760Z', dob_month=7, updated_at=u'2014-12-17T00:38:48.183246Z', phone=None, href=u'/customers/CU6sIkS1KUtHVoPUBM1Gf72B', meta={}, dob_year=1963, email=None, address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': u'48120', u'country_code': None}, id=u'CU6sIkS1KUtHVoPUBM1Gf72B', business_name=None, ssn_last4=None, merchant_status=u'underwritten', ein=None)
% endif