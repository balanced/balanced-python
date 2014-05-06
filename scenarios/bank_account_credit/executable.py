import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA7zu6QXmylsn0o6qVpS8UO9')
bank_account.credit(
  amount=5000
)