% if mode == 'definition':
balanced.Debit.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

debits = balanced.Debit.query
% elif mode == 'response':

% endif