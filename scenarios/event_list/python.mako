% if mode == 'definition':
balanced.Event.query()
% else:
import balanced

balanced.configure('ak-test-1tUen2a604QT05iGc6p4pbPjTqsAPMFCl')

events = balanced.Event.query.all()
% endif