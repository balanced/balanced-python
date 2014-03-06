% if mode == 'definition':
balanced.Reversal.query()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

reversals = balanced.Reversal.query
% endif