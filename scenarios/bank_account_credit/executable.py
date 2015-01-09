import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA45anEaEr8g0lOhzhcE9VAN')
bank_account.credit(
  amount=5000
)