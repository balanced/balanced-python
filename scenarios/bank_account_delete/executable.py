import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA3Ya2sAlEQE14O1iS17FN0Q')
bank_account.delete()