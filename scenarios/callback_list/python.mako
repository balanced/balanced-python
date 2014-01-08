% if mode == 'definition':
balanced.Callback().query
% else:
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

callbacks = balanced.Callback.query.all()
% endif