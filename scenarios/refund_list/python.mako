% if mode == 'definition':

balanced.Refund.query()
% else:
import balanced

balanced.configure("8386409cfeea11e2b3ee026ba7c1aba6")


refunds = balanced.Refund.query.all();

% endif