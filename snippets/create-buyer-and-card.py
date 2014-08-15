buyer = balanced.Customer(
  name='John Buyer'
).save()

card = balanced.Card(
  expiration_month='12',
  security_code='123',
  number='5105105105105100',
  expiration_year='2020',
  name='John Buyer'
).save()

card.associate_to(buyer)