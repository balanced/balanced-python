import balanced

balanced.configure('b5de51921b2d11e389c4026ba7cac9da')


bank_account = balanced.BankAccount(
  routing_number='121000358'
  type='checking'
  account_number='9900000001'
  name='Johann Bernoulli'
).save()