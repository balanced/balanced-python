% if mode == 'definition':
balanced.BankAccount.query()
% else:
import balanced

balanced.configure('b5de51921b2d11e389c4026ba7cac9da')


bank_accounts = balanced.BankAccount.query.all()
% endif