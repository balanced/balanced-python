% if mode == 'definition':

balanced.Account.add_card
% else:
import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")


account = balanced.Account.find('/v1/marketplaces/TEST-MP29J5STPtZVvnjAFndM0N62/accounts/AC1SUaFl5mNtKGOA3LeO2IxN')
account.add_card('/v1/marketplaces/TEST-MP29J5STPtZVvnjAFndM0N62/cards/CC1UxG1UwXYFcslMhp4wq2Mg')

% endif