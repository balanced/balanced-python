% if mode == 'definition':
balanced.Callback.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

callbacks = balanced.Callback.query
% elif mode == 'response':

% endif