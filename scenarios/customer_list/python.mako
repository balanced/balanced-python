% if mode == 'definition':
balanced.Customer.query
% else:
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

customers = balanced.Customer.query
% endif
