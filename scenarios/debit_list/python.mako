% if mode == 'definition':

balanced.Debit.query()
% else:
import balanced

balanced.configure("8386409cfeea11e2b3ee026ba7c1aba6")


debits = balanced.Debit.query.all();

% endif