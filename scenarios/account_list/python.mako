% if mode == 'definition':
balanced.Account.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

accounts = balanced.Account.query
% elif mode == 'response':

% endif