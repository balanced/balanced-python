% if mode == 'definition':
balanced.Customer().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

customer = balanced.Customer(
    dob_year=1963,
    dob_month=7,
    name='Henry Ford',
    address={
        'postal_code': '48120'
    }
).save()
% elif mode == 'response':
Customer(name=u'Henry Ford', links={u'source': None, u'destination': None}, created_at=u'2014-04-25T20:10:14.759932Z', dob_month=7, updated_at=u'2014-04-25T20:10:15.048688Z', phone=None, href=u'/customers/CU4MnFEab304anOtUtEu5hkN', meta={}, dob_year=1963, email=None, address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': u'48120', u'country_code': None}, id=u'CU4MnFEab304anOtUtEu5hkN', business_name=None, ssn_last4=None, merchant_status=u'underwritten', ein=None)
% endif