% if mode == 'definition':

balanced.Hold.query()
% else:
import balanced

balanced.configure("8386409cfeea11e2b3ee026ba7c1aba6")


holds = balanced.Hold.query.all();

% endif