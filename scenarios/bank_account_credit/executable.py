import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA4JCiiAb4alhWMlZSv9POAU')
bank_account.credit(
  amount=5000
)