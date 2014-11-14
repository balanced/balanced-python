% if mode == 'definition':
balanced.APIKey().delete()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

key = balanced.APIKey.fetch('/api_keys/AKJnLWedoBhUHpdhoGEOPew')
key.delete()
% elif mode == 'response':

% endif