% if mode == 'definition':
balanced.Customer().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

customer = balanced.Debit.fetch('/customers/CU5YopHN07Ul5XQnILUifeQT')
customer.email = 'email@newdomain.com'
customer.meta = {
  'shipping-preference': 'ground'
}
customer.save()
% elif mode == 'response':
Customer(name=u'Henry Ford', links={u'source': None, u'destination': None}, created_at=u'2014-03-06T19:23:15.982885Z', dob_month=7, updated_at=u'2014-03-06T19:23:20.140160Z', phone=None, href=u'/customers/CU5YopHN07Ul5XQnILUifeQT', meta={u'shipping-preference': u'ground'}, dob_year=1963, email=u'email@newdomain.com', address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': u'48120', u'country_code': None}, id=u'CU5YopHN07Ul5XQnILUifeQT', business_name=None, ssn_last4=None, merchant_status=u'underwritten', ein=None)
% endif