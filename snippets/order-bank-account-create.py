bank_account = balanced.BankAccount(
  routing_number='121000358',
  type='checking',
  account_number='9900000001',
  name='Henry Ford'
).save()

bank_account.associate_to(merchant)