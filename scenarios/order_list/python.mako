% if mode == 'definition':
balanced.Order.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

orders = balanced.Order.query
% elif mode == 'response':

% endif