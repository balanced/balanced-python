% if mode == 'definition':
balanced.APIKey.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

key = balanced.APIKey.fetch('/api_keys/AK1vqjn1eEHXP0JYXrBrjH5c')
% elif mode == 'response':
{u'created_at': u'2014-01-27T22:56:01.641736Z', u'href': u'/api_keys/AK1vqjn1eEHXP0JYXrBrjH5c', u'meta': {}, u'id': u'AK1vqjn1eEHXP0JYXrBrjH5c', u'links': {}}
% endif