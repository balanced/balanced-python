% if mode == 'definition':
balanced.Event().query
% else:
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

events = balanced.Event.query
% endif