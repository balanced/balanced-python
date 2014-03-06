% if mode == 'definition':
balanced.Debit.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

debits = balanced.Debit.query
% endif