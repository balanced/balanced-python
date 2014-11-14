% if mode == 'definition':
balanced.Credit.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

credits = balanced.Credit.query
% elif mode == 'response':

% endif