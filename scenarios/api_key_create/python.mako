% if mode == 'definition':
balanced.APIKey()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

api_key = balanced.APIKey().save()
% elif mode == 'response':
APIKey(links={}, created_at=u'2014-12-18T18:20:54.950589Z', secret=u'ak-test-2s6vMXj5TtFJzMDptyJufa0QObbpZkWqf', href=u'/api_keys/AK2Phglc8FZEbSJWy3H7UeB7', meta={}, id=u'AK2Phglc8FZEbSJWy3H7UeB7')
% endif