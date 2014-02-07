% if mode == 'definition':
balanced.APIKey

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

api_key = balanced.APIKey()
api_key.save()
% elif mode == 'response':
{u'links': {}, u'created_at': u'2014-01-27T22:56:01.641736Z', u'secret': u'ak-test-1jlJCdGZjRWWYRF1iLBR69xwqG2NdQifv', u'href': u'/api_keys/AK1vqjn1eEHXP0JYXrBrjH5c', u'meta': {}, u'id': u'AK1vqjn1eEHXP0JYXrBrjH5c'}
% endif