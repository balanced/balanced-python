% if mode == 'definition':

balanced.Account.refunds
% else:
import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")


buyer = balanced.Account.find('/v1/marketplaces/TEST-MP29J5STPtZVvnjAFndM0N62/accounts/AC2CcqNuwOGPFi8oaeeVik6y')
refunds = buyer.refunds.all()

% endif