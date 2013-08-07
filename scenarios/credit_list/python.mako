% if mode == 'definition':

balanced.Credit.query
% else:
import balanced

balanced.configure("8386409cfeea11e2b3ee026ba7c1aba6")


credits = balanced.Credit.query.all()

% endif