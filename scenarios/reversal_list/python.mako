% if mode == 'definition':
balanced.Reversal.query()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-nngzAf2ARJV0AA4zzxdyVYJWRa0WLa5I')

reversals = balanced.Reversal.query
% endif