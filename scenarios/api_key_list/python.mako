% if mode == 'definition':
balanced.APIKey.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

keys = balanced.APIKey.query
% elif mode == 'response':

% endif