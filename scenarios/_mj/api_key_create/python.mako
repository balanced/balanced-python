% if mode == 'definition':
balanced.APIKey

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

api_key = balanced.APIKey()
api_key.save()
% elif mode == 'response':
APIKey(**{
 'created_at': u'2014-01-27T22:56:01.641736Z',
 'href': u'/api_keys/AK1vqjn1eEHXP0JYXrBrjH5c',
 'id': u'AK1vqjn1eEHXP0JYXrBrjH5c',
 'links': {},
 'meta': {},
 'secret': u'ak-test-1jlJCdGZjRWWYRF1iLBR69xwqG2NdQifv'
})
% endif