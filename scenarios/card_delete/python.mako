% if mode == 'definition':
balanced.Card().unstore()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

card = balanced.Card.fetch('/cards/CC4mYF7dj7X6OA2K5F0Qyb4N')
card.unstore()
% elif mode == 'response':

% endif