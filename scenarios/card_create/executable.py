import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

card = balanced.Card(
  cvv='123',
  expiration_month='12',
  number='5105105105105100',
  expiration_year='2020'
).save()