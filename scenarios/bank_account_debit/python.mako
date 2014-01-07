% if mode == 'definition':
balanced.BankAccount.debit()
% else:
import balanced

balanced.configure('ak-test-1tUen2a604QT05iGc6p4pbPjTqsAPMFCl')

bank_account = balanced.BankAccount.find('/bank_accounts/BA6b9fFSyfhg5xK51iCmPjNZ/debits')
bank_account.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% endif