% if mode == 'definition':

balanced.Account.refunds
% else:
import balanced

balanced.configure("8386409cfeea11e2b3ee026ba7c1aba6")


buyer = balanced.Account.find('/v1/marketplaces/TEST-MP40BcQ7XUk3TlZOupT5Y3Nm/accounts/AC4aHI8dZiHocr1M5FARdZzg')
refunds = buyer.refunds.all()

% endif