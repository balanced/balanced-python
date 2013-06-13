% if mode == 'definition':

balanced.BankAccount.delete()
% else:
import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")


bank_account = balanced.BankAccount.find("/v1/bank_accounts/BA2af6ai3i6WZZ0FMrI4OKhk")
bank_account.delete()

% endif