import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")


bank_account = balanced.BankAccount.find("/v1/bank_accounts/BA2k3nC4a9llhZFWsBjdGuKI")
verification = bank_account.verify()