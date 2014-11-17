% if mode == 'definition':
balanced.APIKey.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

key = balanced.APIKey.fetch('/api_keys/AKJnLWedoBhUHpdhoGEOPew')
% elif mode == 'response':
APIKey(created_at=u'2014-11-14T19:26:45.904618Z', href=u'/api_keys/AKJnLWedoBhUHpdhoGEOPew', meta={}, id=u'AKJnLWedoBhUHpdhoGEOPew', links={})
% endif