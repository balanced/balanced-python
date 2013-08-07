import balanced

balanced.configure("8386409cfeea11e2b3ee026ba7c1aba6")


bank_account = balanced.BankAccount(
    routing_number='121000358',
    type='checking',
    account_number='9900000001',
    name='Johann Bernoulli',
).save()