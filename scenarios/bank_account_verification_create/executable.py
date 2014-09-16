import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA1BPjHr0Gjc62pLAlkYCH1b')
verification = bank_account.verify()