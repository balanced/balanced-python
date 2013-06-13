import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")


customer = balanced.Customer.find('/v1/customers/CU3Bv5nYd7GOtfJGzw64JfbE')
customer.add_bank_account('/v1/bank_accounts/BA3CGZogWn0gWzoYA5jALkZs')