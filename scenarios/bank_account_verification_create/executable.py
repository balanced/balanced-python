import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA3LVXVgJLrzkmB3vUntKJ6t')
verification = bank_account.verify()