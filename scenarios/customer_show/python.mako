% if mode == 'definition':
balanced.Customer.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

customer = balanced.Customer.fetch('/customers/CU5YopHN07Ul5XQnILUifeQT')
% endif