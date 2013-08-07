% if mode == 'definition':

balanced.Verification.find
% else:
import balanced

balanced.configure("8386409cfeea11e2b3ee026ba7c1aba6")



bank_account = balanced.BankAccount.find("/v1/bank_accounts/BA4oTAYv3ma0dGTWzRAJjBP9")
verification = bank_account.verification

% endif