% if mode == 'definition':
balanced.CardHold.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

card_holds = balanced.CardHold.query
% elif mode == 'response':

% endif