import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

verification = balanced.BankAccountVerification.fetch('/verifications/BZ7n38gpwYou03mkP4Vt83Cl')
verification.confirm(amount_1=1, amount_2=1)