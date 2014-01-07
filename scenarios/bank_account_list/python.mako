% if mode == 'definition':
balanced.BankAccount.query()
% else:
import balanced

balanced.configure('ak-test-1tUen2a604QT05iGc6p4pbPjTqsAPMFCl')

bank_accounts = balanced.BankAccount.query.all()
% endif