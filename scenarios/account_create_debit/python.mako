% if mode == 'definition':

balanced.Account.debit()
% else:
import balanced

balanced.configure("8386409cfeea11e2b3ee026ba7c1aba6")


account = balanced.Account.find('/v1/marketplaces/TEST-MP40BcQ7XUk3TlZOupT5Y3Nm/accounts/AC5YbzH94PeuRxZicqtxCmE8')
account.debit(amount='1000')

% endif