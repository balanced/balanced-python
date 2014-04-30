% if mode == 'definition':
balanced.Card.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

cards = balanced.Card.query
% elif mode == 'response':

% endif