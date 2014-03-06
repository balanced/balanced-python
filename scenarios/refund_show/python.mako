% if mode == 'definition':
balanced.Refund.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

refund = balanced.Refund.fetch('/refunds/RF6HsnqferSuES9VZEWrthG2')
% endif