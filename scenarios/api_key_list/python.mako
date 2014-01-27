% if mode == 'definition':
balanced.APIKey.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-nngzAf2ARJV0AA4zzxdyVYJWRa0WLa5I')

keys = balanced.APIKey.query
% endif