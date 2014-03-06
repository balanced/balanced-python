% if mode == 'definition':
balanced.Event.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

events = balanced.Event.query
% endif