% if mode == 'definition':
balanced.Order.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

orders = balanced.Order.query
% elif mode == 'response':

% endif