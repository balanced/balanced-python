% if mode == 'definition':
balanced.APIKey

% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

api_key = balanced.APIKey()
api_key.save()
% elif mode == 'response':
APIKey(links={}, created_at=u'2014-04-25T21:59:54.024155Z', secret=u'ak-test-2ouh9CXrssudvHruEZ1Ymcrna05kmigfw', href=u'/api_keys/AK7gg5FNb0Owb6hErcMm0CZ7', meta={}, id=u'AK7gg5FNb0Owb6hErcMm0CZ7')
% endif