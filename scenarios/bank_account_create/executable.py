import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

bank_account = balanced.BankAccount(
  routing_number='121000358',
  account_type='checking',
  account_number='9900000001',
  name='Johann Bernoulli'
).save()