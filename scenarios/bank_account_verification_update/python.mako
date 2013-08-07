% if mode == 'definition':

balanced.Verification.save
% else:
import balanced

balanced.configure("8386409cfeea11e2b3ee026ba7c1aba6")


bank_account = balanced.BankAccount.find('/v1/bank_accounts/BA4sfKpb9c7jNeC6iHKvFwDc')
verification = bank_account.verification
verification.amount_1 = 1
verification.amount_2 = 1
verification.save

% endif