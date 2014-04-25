% if mode == 'definition':
balanced.Customer.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

customers = balanced.Customer.query
% elif mode == 'response':

% endif