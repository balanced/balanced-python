import balanced

balanced.configure("8386409cfeea11e2b3ee026ba7c1aba6")


bank_account = balanced.BankAccount.find("/v1/bank_accounts/BA4sfKpb9c7jNeC6iHKvFwDc")
bank_account.delete()