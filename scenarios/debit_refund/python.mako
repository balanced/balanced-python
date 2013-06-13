% if mode == 'definition':

balanced.Debit.refund()
% else:
import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")


debit = balanced.Debit.find('/v1/marketplaces/TEST-MP29J5STPtZVvnjAFndM0N62/debits/WD34DXMbIYa7VCEu6uZFmgZk')
debit.refund()

% endif