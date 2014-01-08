% if mode == 'definition':
balanced.Order().query
% else:
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

orders = balanced.Order.query
% endif