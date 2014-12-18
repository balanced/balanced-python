% if mode == 'definition':
balanced.Customer().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

customer = balanced.Debit.fetch('/customers/CU6gruzuRsaAGeHQFU4YweON')
customer.email = 'email@newdomain.com'
customer.meta = {
  'shipping-preference': 'ground'
}
customer.save()
% elif mode == 'response':
Customer(name=u'Henry Ford', links={u'source': None, u'destination': None}, created_at=u'2014-12-17T00:38:37.009629Z', dob_month=7, updated_at=u'2014-12-17T00:38:45.097470Z', phone=None, href=u'/customers/CU6gruzuRsaAGeHQFU4YweON', meta={u'shipping-preference': u'ground'}, dob_year=1963, email=u'email@newdomain.com', address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': u'48120', u'country_code': None}, id=u'CU6gruzuRsaAGeHQFU4YweON', business_name=None, ssn_last4=None, merchant_status=u'underwritten', ein=None)
% endif