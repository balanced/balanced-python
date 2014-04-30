% if mode == 'definition':
balanced.Customer().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

customer = balanced.Customer(
    dob_year=1963,
    dob_month=7,
    name='Henry Ford',
    address={
        'postal_code': '48120'
    }
).save()
% elif mode == 'response':
Customer(name=u'Henry Ford', links={u'source': None, u'destination': None}, created_at=u'2014-04-25T22:00:53.236370Z', dob_month=7, updated_at=u'2014-04-25T22:00:53.428856Z', phone=None, href=u'/customers/CUxN95d3eKLokMS6CymVtIB', meta={}, dob_year=1963, email=None, address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': u'48120', u'country_code': None}, id=u'CUxN95d3eKLokMS6CymVtIB', business_name=None, ssn_last4=None, merchant_status=u'underwritten', ein=None)
% endif