% if mode == 'definition':
balanced.Callback.query.all
% else:
import balanced

balanced.configure('ak-test-1tUen2a604QT05iGc6p4pbPjTqsAPMFCl')

callbacks = balanced.Callback.query.all()
% endif