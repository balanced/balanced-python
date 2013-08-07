% if mode == 'definition':

balanced.Event.query
% else:
import balanced

balanced.configure("8386409cfeea11e2b3ee026ba7c1aba6")


callbacks = balanced.Event.query.all();

% endif