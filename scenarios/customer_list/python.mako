% if mode == 'definition':
balanced.Customer.query()
% else:
import balanced

balanced.configure('ak-test-1tUen2a604QT05iGc6p4pbPjTqsAPMFCl')

customers = balanced.Customer.query.all()
% endif