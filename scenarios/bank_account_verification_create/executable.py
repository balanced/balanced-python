import balanced

balanced.configure('ak-test-nngzAf2ARJV0AA4zzxdyVYJWRa0WLa5I')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA2YEZjgBPUBzXgxXfjUeenw')
verification = bank_account.verify()