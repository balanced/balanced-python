% if mode == 'definition':
balanced.Refund.query
% else:
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

refunds = balanced.Refund.query
% endif
