% if mode == 'definition':

balanced.Debit.refund()
% else:
import balanced

balanced.configure("8386409cfeea11e2b3ee026ba7c1aba6")


debit = balanced.Debit.find('/v1/marketplaces/TEST-MP40BcQ7XUk3TlZOupT5Y3Nm/debits/WD5hKOubxx6UWLzsJnQGv5F5')
debit.refund()

% endif