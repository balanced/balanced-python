% if mode == 'definition':
balanced.Account.hold()
% else:
import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")

account = balanced.Account.find('/v1/marketplaces/TEST-MP29J5STPtZVvnjAFndM0N62/accounts/AC1SUaFl5mNtKGOA3LeO2IxN')
account.hold(100)
% endif