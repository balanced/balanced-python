# time has elapsed, so find the BankAccountVerification
verification = balanced.BankAccountVerification.find('/verifications/BZ2Sy2Z4Bp2mARnCLztiu2VG')
verification.confirm(amount_1=1, amount_2=1)