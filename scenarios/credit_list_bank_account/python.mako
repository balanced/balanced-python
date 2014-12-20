% if mode == 'definition':
balanced.BankAccount.credits()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA3uzbngfVXy1SGg25Et7iKY')
credits = bank_account.credits
% elif mode == 'response':

% endif