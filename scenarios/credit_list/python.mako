% if mode == 'definition':
balanced.Credit.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

credits = balanced.Credit.query
% elif mode == 'response':

% endif