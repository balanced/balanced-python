% if mode == 'definition':
balanced.Order.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

orders = balanced.Order.query
% elif mode == 'response':

% endif