import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

bank_account = balanced.BankAccount(
  routing_number='121000358',
  account_type='checking',
  account_number='9900000001',
  name='Johann Bernoulli'
).save()