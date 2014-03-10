% if mode == 'definition':
balanced.Credit.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

credits = balanced.Credit.query
% elif mode == 'response':

% endif