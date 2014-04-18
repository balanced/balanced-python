import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

verification = balanced.BankAccountVerification.fetch('/verifications/BZ2AZ05mk2SQsEcicjSh3UN')
verification.confirm(amount_1=1, amount_2=1)