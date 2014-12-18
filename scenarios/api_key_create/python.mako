% if mode == 'definition':
balanced.APIKey()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

api_key = balanced.APIKey().save()
% elif mode == 'response':
APIKey(links={}, created_at=u'2014-12-17T00:36:44.621325Z', secret=u'ak-test-2zkVyNvJLrBn4mc1udeR9S2CFXCQvzWKN', href=u'/api_keys/AK4e2JjsmVYES9oUwqRYg8hy', meta={}, id=u'AK4e2JjsmVYES9oUwqRYg8hy')
% endif