% if mode == 'definition':

balanced.BankAccount.credit()
% else:
import balanced

balanced.configure("8386409cfeea11e2b3ee026ba7c1aba6")


bank_account = balanced.BankAccount.find('/v1/bank_accounts/BA4xg7wvGiKLcFipQYWsVDJR')
credit = bank_account.credit(10000)

% endif