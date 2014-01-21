% if mode == 'definition':
balanced.APIKey().delete()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

key = balanced.APIKey.find('/api_keys/AK2MIAdNHBolYbbacv2OSosg')
key.delete()
% endif