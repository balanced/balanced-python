% if mode == 'definition':
balanced.Card().unstore()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

card = balanced.Card.fetch('/cards/CC48j1De9eVYELLivrgDeCM8')
card.unstore()
% elif mode == 'response':

% endif