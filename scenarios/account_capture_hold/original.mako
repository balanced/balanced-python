% if mode == 'definition':

balanced.Account.debit()
% else:
import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")


account = balanced.Account.find('/v1/marketplaces/TEST-MP29J5STPtZVvnjAFndM0N62/accounts/AC41WWE1V0nZtw5J8BicNwnB')
account.debit(amount=1000, hold_uri='/v1/marketplaces/TEST-MP29J5STPtZVvnjAFndM0N62/holds/HL4b3zuvRlumVNFMeKl0h5Pk')

% endif