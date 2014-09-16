% if mode == 'definition':
balanced.Card().unstore()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

card = balanced.Card.fetch('/cards/CC4OTo7bbk25ZWmhdQCdXkPu')
card.unstore()
% elif mode == 'response':

% endif