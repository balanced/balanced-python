% if mode == 'definition':
balanced.Card().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

card = balanced.Card(
  cvv='123',
  expiration_month='12',
  number='5105105105105100',
  expiration_year='2020'
).save()
% endif