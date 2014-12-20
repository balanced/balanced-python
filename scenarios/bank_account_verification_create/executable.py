import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA305R4Vwumo1KjT9kwVrdfT')
verification = bank_account.verify()