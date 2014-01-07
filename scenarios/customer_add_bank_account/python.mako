% if mode == 'definition':
balanced.Customer.add_bank_account
% else:
import balanced

balanced.configure('ak-test-1tUen2a604QT05iGc6p4pbPjTqsAPMFCl')

customer = balanced.Customer.find('/customers/CU7cMba1Uu9Dz2DHguDKcxao')
customer.add_bank_account('/bank_accounts/BA6jsxwAXYrt4sLjYUw1a1gS')
% endif