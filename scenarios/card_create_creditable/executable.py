import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

card = balanced.Card(
  expiration_month='05',
  name='Johannes Bach',
  expiration_year='2020',
  number='4342561111111118'
).save()