% if mode == 'definition':
balanced.Customer().unstore()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

customer = balanced.Customer.find('/customers/CU3QDD1R3iMoGbwiCnoHfd6W')
customer.unstore()
% endif