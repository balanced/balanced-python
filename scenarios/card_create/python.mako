% if mode == 'definition':
balanced.Card().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-nngzAf2ARJV0AA4zzxdyVYJWRa0WLa5I')

card = balanced.Card(
  expiration_month='12',
  security_code='123',
  number='5105105105105100',
  expiration_year='2020'
).save()
% endif