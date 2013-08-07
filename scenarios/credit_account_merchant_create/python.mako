% if mode == 'definition':

balanced.Account.credit()
% else:
import balanced

balanced.configure("8386409cfeea11e2b3ee026ba7c1aba6")


merchant =  balanced.Account.find('/v1/marketplaces/TEST-MP40BcQ7XUk3TlZOupT5Y3Nm/accounts/AC4aHI8dZiHocr1M5FARdZzg')
merchant.credit(100)

% endif