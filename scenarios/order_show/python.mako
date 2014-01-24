% if mode == 'definition':
balanced.Order.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-nngzAf2ARJV0AA4zzxdyVYJWRa0WLa5I')

order = balanced.Order.fetch('/orders/OR4bkzheH5eeQpl0J9Dmrx27')
% endif