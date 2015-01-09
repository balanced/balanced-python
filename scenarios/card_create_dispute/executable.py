import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

card = balanced.Card(
  cvv='123',
  expiration_month='12',
  number='6500000000000002',
  expiration_year='3000'
).save()