% if mode == 'definition':
balanced.Card().associate_to_customer()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-nngzAf2ARJV0AA4zzxdyVYJWRa0WLa5I')

card = balanced.Card.fetch('/bank_accounts/BA3YBUkHZNRVugUmhBGE3A9G')
card.associate_to_customer('/customers/CU3Ttx347VFA9lYT8dBOkwcu')
% endif