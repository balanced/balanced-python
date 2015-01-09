% if mode == 'definition':
balanced.Refund.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

refunds = balanced.Refund.query
% elif mode == 'response':

% endif