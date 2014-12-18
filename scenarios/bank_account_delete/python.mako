% if mode == 'definition':
balanced.BankAccount().delete()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA4GVxlUHmn8y0CjAUEcW6Kp')
bank_account.delete()
% elif mode == 'response':

% endif