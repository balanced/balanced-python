import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

verification = balanced.BankAccountVerification.fetch('/verifications/BZ4x3kqJ5rTrM8LL0WmP4GUZ')
verification.confirm(amount_1=1, amount_2=1)