% if mode == 'definition':
balanced.Order.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

orders = balanced.Order.query
% elif mode == 'response':

% endif