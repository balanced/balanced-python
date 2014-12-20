% if mode == 'definition':
balanced.Account.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

accounts = balanced.Account.query
% elif mode == 'response':

% endif