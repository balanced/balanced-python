import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

bank_account = balanced.BankAccount(
  routing_number='121000358',
  account_type='checking',
  account_number='9900000001',
  name='Johann Bernoulli'
).save()