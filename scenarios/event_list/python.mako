% if mode == 'definition':

balanced.Event.query
% else:
import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")


callbacks = balanced.Event.query.all();

% endif