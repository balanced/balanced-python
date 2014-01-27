% if mode == 'definition':
balanced.APIKey

% elif mode == 'request':
import balanced

balanced.configure('ak-test-nngzAf2ARJV0AA4zzxdyVYJWRa0WLa5I')

api_key = balanced.APIKey()
api_key.save()
% endif