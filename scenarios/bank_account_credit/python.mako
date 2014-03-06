% if mode == 'definition':
balanced.BankAccount().credit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA6bLGpQZPOiTNRxF24rMd9m')
bank_account.credit(
  amount=5000
)
% endif