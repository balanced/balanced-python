% if mode == 'definition':
balanced.Event.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

events = balanced.Event.query
% elif mode == 'response':

% endif