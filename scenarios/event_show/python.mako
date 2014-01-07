% if mode == 'definition':
balanced.Event.find()
% else:
import balanced

balanced.configure('ak-test-1tUen2a604QT05iGc6p4pbPjTqsAPMFCl')

event = balanced.Event.find('/events/EVce72c4ba77c911e3a3be026ba7cac9da')
% endif