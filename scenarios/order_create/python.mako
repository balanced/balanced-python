% if mode == 'definition':
balanced.Order()
% else:
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

order = balanced.Order(
  description='Order #12341234'
).save()
% endif