% if mode == 'definition':
balanced.APIKey.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

key = balanced.APIKey.fetch('/api_keys/AK2MIAdNHBolYbbacv2OSosg')
% endif