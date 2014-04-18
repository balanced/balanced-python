import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BAscOV2erMwv3yhIb5sFTaV')
bank_account.credit(
  amount=5000
)