import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")


card = balanced.Card(
    expiration_month='12',
    security_code='123',
    card_number='5105105105105100',
    expiration_year='2020',
).save()