% if mode == 'definition':
balanced.BankAccount.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

bank_accounts = balanced.BankAccount.query
% elif mode == 'response':

% endif