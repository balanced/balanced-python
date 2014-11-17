% if mode == 'definition':
balanced.APIKey()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

api_key = balanced.APIKey().save()
% elif mode == 'response':
APIKey(links={}, created_at=u'2014-11-14T19:26:45.904618Z', secret=u'ak-test-2xP79D9WIwTI77JPABpo8uL8cqgEFq2c', href=u'/api_keys/AKJnLWedoBhUHpdhoGEOPew', meta={}, id=u'AKJnLWedoBhUHpdhoGEOPew')
% endif