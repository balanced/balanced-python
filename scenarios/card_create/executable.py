import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

card = balanced.Card(
  cvv='123',
  expiration_month='12',
  number='5105105105105100',
  expiration_year='2020'
).save()