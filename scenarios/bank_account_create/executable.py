import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

bank_account = balanced.BankAccount(
  routing_number='121000358',
  account_type='checking',
  account_number='9900000001',
  name='Johann Bernoulli'
).save()