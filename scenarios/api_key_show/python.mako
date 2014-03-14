% if mode == 'definition':
balanced.APIKey.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

key = balanced.APIKey.fetch('/api_keys/AK4Vt1mJyCtjdSiGgqAebarR')
% elif mode == 'response':
APIKey(created_at=u'2014-03-06T19:22:18.256643Z', href=u'/api_keys/AK4Vt1mJyCtjdSiGgqAebarR', meta={}, id=u'AK4Vt1mJyCtjdSiGgqAebarR', links={})
% endif