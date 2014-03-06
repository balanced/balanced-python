% if mode == 'definition':
balanced.Debit.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

debit = balanced.Debit.fetch('/debits/WD5PTwr2bwJLIyJio1pEpYBr')
% endif