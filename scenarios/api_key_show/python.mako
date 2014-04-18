% if mode == 'definition':
balanced.APIKey.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

key = balanced.APIKey.fetch('/api_keys/AK7KGjv4YKtOf03Lqm0f84V')
% elif mode == 'response':
APIKey(created_at=u'2014-04-17T22:38:39.103798Z', href=u'/api_keys/AK7KGjv4YKtOf03Lqm0f84V', meta={}, id=u'AK7KGjv4YKtOf03Lqm0f84V', links={})
% endif