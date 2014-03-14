% if mode == 'definition':
balanced.Credit.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

credits = balanced.Credit.query
% elif mode == 'response':

% endif