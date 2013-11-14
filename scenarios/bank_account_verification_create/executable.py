import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

bank_account = balanced.BankAccount.find('/v1/bank_accounts/BAA31STlZw3eRtjJHyyr0aC')
verification = bank_account.verify()