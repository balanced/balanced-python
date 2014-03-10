% if mode == 'definition':
balanced.BankAccount.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

bank_accounts = balanced.BankAccount.query
% elif mode == 'response':

% endif