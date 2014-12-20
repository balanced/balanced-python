% if mode == 'definition':
balanced.APIKey.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

key = balanced.APIKey.fetch('/api_keys/AK2Phglc8FZEbSJWy3H7UeB7')
% elif mode == 'response':
APIKey(created_at=u'2014-12-18T18:20:54.950589Z', href=u'/api_keys/AK2Phglc8FZEbSJWy3H7UeB7', meta={}, id=u'AK2Phglc8FZEbSJWy3H7UeB7', links={})
% endif