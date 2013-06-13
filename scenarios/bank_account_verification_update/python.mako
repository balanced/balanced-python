% if mode == 'definition':

balanced.Verification.save
% else:
import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")


bank_account = balanced.BankAccount.find('/v1/bank_accounts/BA2q0W6DqBAtytLyfBAD4p3y')
verification = bank_account.verification
verification.amount_1 = 1
verification.amount_2 = 1
verification.save

% endif