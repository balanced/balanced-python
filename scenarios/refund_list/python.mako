% if mode == 'definition':
balanced.Refund.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

refunds = balanced.Refund.query
% endif