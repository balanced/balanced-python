% if mode == 'definition':
balanced.Event.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

events = balanced.Event.query
% elif mode == 'response':

% endif