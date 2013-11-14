import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')
verification = balanced.BankAccountVerification.find('/v1/bank_accounts/BARHVIjybOf6v3uQsYOnAYE/verifications/BZTEkn24x0fcao764SiSGTC')
verification.amount_1 = 1
verification.amount_2 = 1
verification.save