% if mode == 'definition':
balanced.APIKey.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

key = balanced.APIKey.fetch('/api_keys/AK4e2JjsmVYES9oUwqRYg8hy')
% elif mode == 'response':
APIKey(created_at=u'2014-12-17T00:36:44.621325Z', href=u'/api_keys/AK4e2JjsmVYES9oUwqRYg8hy', meta={}, id=u'AK4e2JjsmVYES9oUwqRYg8hy', links={})
% endif