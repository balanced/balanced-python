% if mode == 'definition':
balanced.Settlement.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

settlements = balanced.Settlement.query
% elif mode == 'response':

% endif