% if mode == 'definition':
balanced.Customer.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-nngzAf2ARJV0AA4zzxdyVYJWRa0WLa5I')

customer = balanced.Customer.fetch('/customers/CU3OK2QNsz3KjXHMz1GCH1Cq')
% endif