% if mode == 'definition':
balanced.Settlement.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

account = balanced.Account.fetch('/accounts/AT2E6Ju62P9AnTJwe0fL5kOI')
account.settlements
% elif mode == 'response':

% endif