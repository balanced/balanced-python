% if mode == 'definition':
balanced.Customer().unstore()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-nngzAf2ARJV0AA4zzxdyVYJWRa0WLa5I')

customer = balanced.Customer.fetch('/customers/CU3Ttx347VFA9lYT8dBOkwcu')
customer.unstore()
% endif