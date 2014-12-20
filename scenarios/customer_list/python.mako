% if mode == 'definition':
balanced.Customer.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

customers = balanced.Customer.query
% elif mode == 'response':

% endif