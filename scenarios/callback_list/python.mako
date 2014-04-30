% if mode == 'definition':
balanced.Callback.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

callbacks = balanced.Callback.query
% elif mode == 'response':

% endif