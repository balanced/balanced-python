% if mode == 'definition':
balanced.Dispute.query
% elif mode == 'request':
import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

disputes = balanced.Dispute.query
% elif mode == 'response':

% endif