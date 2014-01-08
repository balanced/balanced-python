% if mode == 'definition':
balanced.Order().find()
% else:
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

order = balanced.Order.find('/orders/OR47s8iZqDt662LdYa5My3oK')
% endif