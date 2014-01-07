% if mode == 'definition':
balanced.Credit.query()
% else:
import balanced

balanced.configure('ak-test-1tUen2a604QT05iGc6p4pbPjTqsAPMFCl')

credits = balanced.Credit.query.all()
% endif