% if mode == 'definition':
balanced.BankAccount.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA58WYAEUMrEtAkW5KAvWo5V')
% endif