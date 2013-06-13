% if mode == 'definition':


% else:
import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")


bank_account = balanced.BankAccount.find("/v1/bank_accounts/BA3CGZogWn0gWzoYA5jALkZs")
bank_account.delete()

% endif