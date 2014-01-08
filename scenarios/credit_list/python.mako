% if mode == 'definition':
balanced.Credit().query
% else:
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

credits = balanced.Credit.query
% endif