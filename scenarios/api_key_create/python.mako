% if mode == 'definition':
balanced.APIKey()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

api_key = balanced.APIKey().save()
% elif mode == 'response':
APIKey(links={}, created_at=u'2015-01-09T03:23:00.061959Z', secret=u'ak-test-2i4j501b699lmRiGiCcIg45CM0bBI0JAQ', href=u'/api_keys/AK3DQGzROuoRYulKXMQdHBxX', meta={}, id=u'AK3DQGzROuoRYulKXMQdHBxX')
% endif