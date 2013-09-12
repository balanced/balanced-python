% if mode == 'definition':
balanced.BankAccount.credit()
% else:
import balanced

balanced.configure('b5de51921b2d11e389c4026ba7cac9da')


bank_account = balanced.BankAccount.find('/v1/bank_accounts/BA64dSsZGdvarB2a0Mx2qeqs')
credit = bank_account.credit(amount=10000)
% endif