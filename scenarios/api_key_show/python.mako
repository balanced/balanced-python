% if mode == 'definition':
balanced.APIKey.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

key = balanced.APIKey.fetch('/api_keys/AK7gg5FNb0Owb6hErcMm0CZ7')
% elif mode == 'response':
APIKey(created_at=u'2014-04-25T21:59:54.024155Z', href=u'/api_keys/AK7gg5FNb0Owb6hErcMm0CZ7', meta={}, id=u'AK7gg5FNb0Owb6hErcMm0CZ7', links={})
% endif