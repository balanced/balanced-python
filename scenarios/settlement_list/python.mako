% if mode == 'definition':
balanced.Settlement.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

settlements = balanced.Settlement.query
% elif mode == 'response':

% endif