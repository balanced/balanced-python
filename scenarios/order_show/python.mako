% if mode == 'definition':
balanced.Order.find
% else:
import balanced

balanced.configure('ak-test-1tUen2a604QT05iGc6p4pbPjTqsAPMFCl')

order = balanced.Order.find('/orders/OR7tbUrFlrIwYwE4iCuhtq0v')
% endif