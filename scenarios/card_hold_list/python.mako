% if mode == 'definition':
balanced.CardHold.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

card_holds = balanced.CardHold.query
% elif mode == 'response':

% endif