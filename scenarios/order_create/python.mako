% if mode == 'definition':
balanced.Order()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

order = balanced.Order(
  description='Order #12341234'
).save()
% endif