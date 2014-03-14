% if mode == 'definition':
balanced.Customer().unstore()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

customer = balanced.Customer.fetch('/customers/CU64R7DS6DwuXYVg9RTskFK8')
customer.unstore()
% elif mode == 'response':

% endif