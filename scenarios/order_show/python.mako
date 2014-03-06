% if mode == 'definition':
balanced.Order.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

order = balanced.Order.fetch('/orders/OR6wcEVkOymvs4PairiGEcIx')
% endif