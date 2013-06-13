import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")


bank_account = balanced.BankAccount(
    routing_number='121000358',
    type='checking',
    account_number='9900000001',
    name='Johann Bernoulli',
).save()