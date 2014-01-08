import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

verification = balanced.BankAccountVerification.find('/verifications/BZ2Sy2Z4Bp2mARnCLztiu2VG')
verification.verify(amount_1=1, amount_2=1)