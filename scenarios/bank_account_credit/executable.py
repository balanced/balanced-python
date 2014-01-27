import balanced

balanced.configure('ak-test-nngzAf2ARJV0AA4zzxdyVYJWRa0WLa5I')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA3YBUkHZNRVugUmhBGE3A9G')
bank_account.credit(
  amount=5000
)