% if mode == 'definition':
balanced.Callback.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

callbacks = balanced.Callback.query
% elif mode == 'response':

% endif