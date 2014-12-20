% if mode == 'definition':
balanced.Customer().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

customer = balanced.Customer(
    dob_year=1963,
    dob_month=7,
    name='Henry Ford',
    address={
        'postal_code': '48120'
    }
).save()
% elif mode == 'response':
Customer(name=u'Henry Ford', links={u'source': None, u'destination': None}, created_at=u'2014-12-18T18:22:34.272892Z', dob_month=7, updated_at=u'2014-12-18T18:22:34.461736Z', phone=None, href=u'/customers/CU4CZc7Xjn8gGJXl1LyzZk7S', meta={}, dob_year=1963, email=None, address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': u'48120', u'country_code': None}, id=u'CU4CZc7Xjn8gGJXl1LyzZk7S', business_name=None, ssn_last4=None, merchant_status=u'underwritten', ein=None)
% endif