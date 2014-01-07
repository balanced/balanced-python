% if mode == 'definition':
balanced.BankAccount.find
% else:
import balanced

balanced.configure('ak-test-1tUen2a604QT05iGc6p4pbPjTqsAPMFCl')

bank_account = balanced.BankAccount.find('/bank_accounts/BA6jsxwAXYrt4sLjYUw1a1gS')
% endif