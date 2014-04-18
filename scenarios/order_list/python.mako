% if mode == 'definition':
balanced.Order.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

orders = balanced.Order.query
% elif mode == 'response':

% endif