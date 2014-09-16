import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA3bgtBxC3q4N9QvlN2jqFnL')
bank_account.credit(
  amount=5000
)