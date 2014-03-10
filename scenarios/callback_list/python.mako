% if mode == 'definition':
balanced.Callback.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

callbacks = balanced.Callback.query
% elif mode == 'response':

% endif