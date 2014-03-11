% if mode == 'definition':
balanced.APIKey

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

api_key = balanced.APIKey()
api_key.save()
% elif mode == 'response':
APIKey(links={}, created_at=u'2014-03-06T19:22:18.256643Z', secret=u'ak-test-4bQUCg96rUwLV8FZXSTeq8WUSqROO9yT', href=u'/api_keys/AK4Vt1mJyCtjdSiGgqAebarR', meta={}, id=u'AK4Vt1mJyCtjdSiGgqAebarR')
% endif