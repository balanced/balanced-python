import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

card = balanced.Card(
  cvv='123',
  expiration_month='12',
  number='5105105105105100',
  expiration_year='2020'
).save()