% if mode == 'definition':
balanced.Event.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-nngzAf2ARJV0AA4zzxdyVYJWRa0WLa5I')

events = balanced.Event.query
% endif