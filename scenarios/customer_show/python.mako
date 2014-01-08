% if mode == 'definition':
balanced.Customer().find()
% else:
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

customer = balanced.Customer.find('/customers/CU3LNFIXs33DopZuksrfp0KY')
% endif