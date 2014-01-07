% if mode == 'definition':
balanced.Verification.save
% else:
import balanced

balanced.configure('ak-test-1tUen2a604QT05iGc6p4pbPjTqsAPMFCl')
verification = balanced.BankAccountVerification.find('/verifications/BZ6cD5IVyWprD3AJTwfi8Bvg')
verification.amount_1 = 1
verification.amount_2 = 1
verification.save
% endif