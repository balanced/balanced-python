% if mode == 'definition':
balanced.Order()
% else:
import balanced

balanced.configure('ak-test-1tUen2a604QT05iGc6p4pbPjTqsAPMFCl')

order = balanced.Order(
  description='Order #12341234'
).save()
% endif