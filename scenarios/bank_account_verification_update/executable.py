import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

verification = balanced.BankAccountVerification.fetch('/verifications/BZ1eMAsKt13lIj2SkvvHlxfT')
verification.confirm(amount_1=1, amount_2=1)