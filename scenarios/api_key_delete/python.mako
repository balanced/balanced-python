% if mode == 'definition':
balanced.APIKey().delete()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

key = balanced.APIKey.fetch('/api_keys/AK2Phglc8FZEbSJWy3H7UeB7')
key.delete()
% elif mode == 'response':

% endif