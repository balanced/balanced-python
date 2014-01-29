% if mode == 'definition':
balanced.Event.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

event = balanced.Event.fetch('/events/EV2abbb98487a611e3a86f026ba7d31e6f')
% endif