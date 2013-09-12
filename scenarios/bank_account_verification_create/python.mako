% if mode == 'definition':
balanced.Verification().save()
% else:
import balanced

balanced.configure('b5de51921b2d11e389c4026ba7cac9da')


bank_account = balanced.BankAccount.find('/v1/bank_accounts/BA5TaLtTXaScg7HD0begXep1')
verification = bank_account.verify()
% endif