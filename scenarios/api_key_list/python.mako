% if mode == 'definition':
balanced.APIKey().query
% else:
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

keys = balanced.APIKey.query
% endif