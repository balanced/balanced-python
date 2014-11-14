% if mode == 'definition':
balanced.CardHold.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

card_holds = balanced.CardHold.query
% elif mode == 'response':

% endif