% if mode == 'definition':

balanced.BankAccount.query()
% else:
import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")


bank_accounts = balanced.BankAccount.query.all()

% endif