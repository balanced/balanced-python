import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")


bank_account = balanced.BankAccount.find('/v1/bank_accounts/BA2fU4b0MNuBHuI3NrvyOsTE')
credits = bank_account.credits.all()