% if mode == 'definition':
balanced.APIKey

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

api_key = balanced.APIKey()
api_key.save()
% endif