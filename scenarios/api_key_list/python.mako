% if mode == 'definition':
balanced.APIKey.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

keys = balanced.APIKey.query
% elif mode == 'response':

% endif