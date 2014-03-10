% if mode == 'definition':
balanced.Card().unstore()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

card = balanced.Card.fetch('/cards/CC2uc8iPDjgyxOXHVtnZloyI')
card.unstore()
% elif mode == 'response':

% endif