import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

card = balanced.Card(
  cvv='123',
  expiration_month='12',
  number='6500000000000002',
  expiration_year='3000'
).save()