import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

verification = balanced.BankAccountVerification.fetch('/verifications/BZ1NndEHupZUuYDNPf75qXPv')
verification.confirm(amount_1=1, amount_2=1)