% if mode == 'definition':
balanced.Settlement.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

account = balanced.Account.fetch('/accounts/AT3ogJE07IErLJYR510QO6sM')
account.settlements
% elif mode == 'response':

% endif