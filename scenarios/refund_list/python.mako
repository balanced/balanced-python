% if mode == 'definition':
balanced.Refund.query()
% else:
import balanced

balanced.configure('ak-test-1tUen2a604QT05iGc6p4pbPjTqsAPMFCl')

refunds = balanced.Refund.query.all()
% endif