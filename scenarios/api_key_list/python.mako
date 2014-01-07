% if mode == 'definition':
balanced.APIKey.query()
% else:
import balanced

balanced.configure('ak-test-1tUen2a604QT05iGc6p4pbPjTqsAPMFCl')

keys = balanced.APIKey.query.all()
% endif