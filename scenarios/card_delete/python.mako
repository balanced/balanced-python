% if mode == 'definition':
balanced.Card().unstore()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

card = balanced.Card.fetch('/cards/CC832pqCbRPor1ewRdxPvnv')
card.unstore()
% elif mode == 'response':

% endif