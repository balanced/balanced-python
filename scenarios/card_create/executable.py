import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

card = balanced.Card(
  expiration_month='12',
  security_code='123',
  card_number='5105105105105100',
  expiration_year='2020'
).save()