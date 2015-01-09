import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

card = balanced.Card(
  expiration_month='05',
  name='Johannes Bach',
  expiration_year='2020',
  number='4342561111111118'
).save()