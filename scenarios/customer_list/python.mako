% if mode == 'definition':
balanced.Customer.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

customers = balanced.Customer.query
% elif mode == 'response':

% endif