% if mode == 'definition':
balanced.Refund.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

refunds = balanced.Refund.query
% elif mode == 'response':

% endif