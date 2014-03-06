% if mode == 'definition':
balanced.APIKey.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

keys = balanced.APIKey.query
% endif