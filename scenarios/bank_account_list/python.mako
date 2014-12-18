% if mode == 'definition':
balanced.BankAccount.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

bank_accounts = balanced.BankAccount.query
% elif mode == 'response':

% endif