% if mode == 'definition':

balanced.BankAccount.query()
% else:
import balanced

balanced.configure("8386409cfeea11e2b3ee026ba7c1aba6")


bank_accounts = balanced.BankAccount.query.all()

% endif