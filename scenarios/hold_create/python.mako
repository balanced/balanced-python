% if mode == 'definition':

balanced.Account.hold(...)
% else:
import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")


buyer = balanced.Account.find('/v1/marketplaces/TEST-MP29J5STPtZVvnjAFndM0N62/accounts/AC2CcqNuwOGPFi8oaeeVik6y')
buyer.hold(
    amount='5000',
    description='Some descriptive text for the debit in the dashboard',
)

% endif