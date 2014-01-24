% if mode == 'definition':
balanced.Reversal.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-nngzAf2ARJV0AA4zzxdyVYJWRa0WLa5I')

refund = balanced.Reversal.fetch('/reversals/RV4rAoQcd3EkOS6rLAUFLrs4')
% endif