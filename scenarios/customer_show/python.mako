% if mode == 'definition':
balanced.Customer.find
% else:
import balanced

balanced.configure('ak-test-1tUen2a604QT05iGc6p4pbPjTqsAPMFCl')

customer = balanced.Customer.find('/customers/CU77fJ0bjn9xBZYlzIYkpUQU')
% endif