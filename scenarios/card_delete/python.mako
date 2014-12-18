% if mode == 'definition':
balanced.Card().unstore()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

card = balanced.Card.fetch('/cards/CC5zxUdioIB0Dc2rjM1PK3Cw')
card.unstore()
% elif mode == 'response':

% endif