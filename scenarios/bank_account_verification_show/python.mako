% if mode == 'definition':
balanced.Verification.find
% else:
import balanced

balanced.configure('ak-test-1tUen2a604QT05iGc6p4pbPjTqsAPMFCl')
verification = balanced.BankAccountVerification.find('/verifications/BZ6cD5IVyWprD3AJTwfi8Bvg')
% endif