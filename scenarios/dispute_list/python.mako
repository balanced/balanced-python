% if mode == 'definition':
balanced.Dispute.query
% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

disputes = balanced.Dispute.query
% elif mode == 'response':

% endif