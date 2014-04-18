% if mode == 'definition':
balanced.Customer().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

customer = balanced.Debit.fetch('/customers/CU194sQ52I1idiwicbg0mOOB')
customer.email = 'email@newdomain.com'
customer.meta = {
  'shipping-preference': 'ground'
}
customer.save()
% elif mode == 'response':
Customer(name=u'Henry Ford', links={u'source': None, u'destination': None}, created_at=u'2014-04-17T22:39:35.399913Z', dob_month=7, updated_at=u'2014-04-17T22:39:39.258231Z', phone=None, href=u'/customers/CU194sQ52I1idiwicbg0mOOB', meta={u'shipping-preference': u'ground'}, dob_year=1963, email=u'email@newdomain.com', address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': u'48120', u'country_code': None}, id=u'CU194sQ52I1idiwicbg0mOOB', business_name=None, ssn_last4=None, merchant_status=u'underwritten', ein=None)
% endif