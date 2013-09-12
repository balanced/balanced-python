% if mode == 'definition':
balanced.Card.save()
% else:
import balanced

balanced.configure('b5de51921b2d11e389c4026ba7cac9da')


card = balanced.Card(
  expiration_month='12'
  security_code='123'
  card_number='5105105105105100'
  expiration_year='2020'
).save()
% endif