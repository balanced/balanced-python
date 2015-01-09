% if mode == 'definition':
balanced.BankAccount.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

bank_accounts = balanced.BankAccount.query
% elif mode == 'response':

% endif