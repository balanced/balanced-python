% if mode == 'definition':
balanced.Verification.save
% else:
import balanced

balanced.configure('b5de51921b2d11e389c4026ba7cac9da')

verification = balanced.BankAccountVerification.find('/v1/bank_accounts/BA5YXVcU9ExcM8jXQhQt7ZY6/verifications/BZ610Qohtgs6VzPXQ2OFve6y')
verification.amount_1 = 1
verification.amount_2 = 1
verification.save
% endif