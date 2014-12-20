import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

verification = balanced.BankAccountVerification.fetch('/verifications/BZ37ck8caI06gKMmpz70Zt6w')
verification.confirm(amount_1=1, amount_2=1)