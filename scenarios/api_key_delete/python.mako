% if mode == 'definition':
balanced.APIKey().delete()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

key = balanced.APIKey.fetch('/api_keys/AK7KGjv4YKtOf03Lqm0f84V')
key.delete()
% elif mode == 'response':

% endif