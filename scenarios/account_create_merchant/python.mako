% if mode == 'definition':

balanced.Account.add_bank_account
% else:
import balanced

balanced.configure("8386409cfeea11e2b3ee026ba7c1aba6")


account = balanced.Account.find('/v1/marketplaces/TEST-MP40BcQ7XUk3TlZOupT5Y3Nm/accounts/AC4aHI8dZiHocr1M5FARdZzg')
account.add_bank_account('/v1/bank_accounts/BA4gGTZiAgLomq8IjMjYcB32')

% endif