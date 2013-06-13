% if mode == 'definition':

balanced.Account.credits
% else:
import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")


merchant = balanced.Account.find('/v1/marketplaces/TEST-MP29J5STPtZVvnjAFndM0N62/accounts/AC2CcqNuwOGPFi8oaeeVik6y')
credits = merchant.credits.all()

% endif