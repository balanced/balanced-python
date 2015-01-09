% if mode == 'definition':
balanced.APIKey.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

key = balanced.APIKey.fetch('/api_keys/AK3DQGzROuoRYulKXMQdHBxX')
% elif mode == 'response':
APIKey(created_at=u'2015-01-09T03:23:00.061959Z', href=u'/api_keys/AK3DQGzROuoRYulKXMQdHBxX', meta={}, id=u'AK3DQGzROuoRYulKXMQdHBxX', links={})
% endif