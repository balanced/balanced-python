import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BAcRGk40xmI8meZpNLB3oYp')
verification = bank_account.verify()