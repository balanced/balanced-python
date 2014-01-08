% if mode == 'definition':
balanced.Reversal().query()
% else:
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

reversals = balanced.Reversal.query
% endif