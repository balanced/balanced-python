% if mode == 'definition':
balanced.Card().unstore()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

card = balanced.Card.fetch('/cards/CC33DRVrekWpiHYjxSdVuqWc')
card.unstore()
% elif mode == 'response':

% endif