% if mode == 'definition':
balanced.Refund.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-nngzAf2ARJV0AA4zzxdyVYJWRa0WLa5I')

refunds = balanced.Refund.query
% endif