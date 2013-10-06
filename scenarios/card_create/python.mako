% if mode == 'definition':
balanced.Card.save()
% else:
import balanced

balanced.configure('ak-test-1p1Tsac7gHeMQowL2seB7ieliuAJAufyq')

card = balanced.Card(
  expiration_month='12'
  security_code='123'
  card_number='5105105105105100'
  expiration_year='2020'
).save()
% endif