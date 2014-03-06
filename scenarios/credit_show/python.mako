% if mode == 'definition':
balanced.Credit.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

credit = balanced.Credit.fetch('/credits/CR5XXPwA1ckaTDSIg3593sEx')
% endif