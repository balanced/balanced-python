% if mode == 'definition':

balanced.Card.save()
% else:
import balanced

balanced.configure("8386409cfeea11e2b3ee026ba7c1aba6")


card = balanced.Card(
    expiration_month='12',
    security_code='123',
    card_number='5105105105105100',
    expiration_year='2020',
).save()

% endif