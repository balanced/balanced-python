import balanced

balanced.configure('ak-test-nngzAf2ARJV0AA4zzxdyVYJWRa0WLa5I')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA35XYq4oVujo1NADZ6vwCu4/credits')
credits = bank_account.credits