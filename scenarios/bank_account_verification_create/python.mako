% if mode == 'definition':
balanced.Verification().save()
% else:
import balanced

balanced.configure('ak-test-1tUen2a604QT05iGc6p4pbPjTqsAPMFCl')

bank_account = balanced.BankAccount.find('/bank_accounts/BA6b9fFSyfhg5xK51iCmPjNZ')
verification = bank_account.verify()
% endif