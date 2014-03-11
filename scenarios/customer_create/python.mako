% if mode == 'definition':
balanced.Customer().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

customer = balanced.Customer(
    dob_year=1963,
    dob_month=7,
    name='Henry Ford',
    address={
        'postal_code': '48120'
    }
).save()
% elif mode == 'response':
Customer(name=u'Henry Ford', links={u'source': None, u'destination': None}, created_at=u'2014-03-06T19:23:21.728225Z', dob_month=7, updated_at=u'2014-03-06T19:23:22.907102Z', phone=None, href=u'/customers/CU64R7DS6DwuXYVg9RTskFK8', meta={}, dob_year=1963, email=None, address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': u'48120', u'country_code': None}, id=u'CU64R7DS6DwuXYVg9RTskFK8', business_name=None, ssn_last4=None, merchant_status=u'underwritten', ein=None)
% endif