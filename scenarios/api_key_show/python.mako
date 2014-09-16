% if mode == 'definition':
balanced.APIKey.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

key = balanced.APIKey.fetch('/api_keys/AK19Ap0xmiz0Oau3K4keBuwg')
% elif mode == 'response':
APIKey(created_at=u'2014-09-02T18:22:50.910606Z', href=u'/api_keys/AK19Ap0xmiz0Oau3K4keBuwg', meta={}, id=u'AK19Ap0xmiz0Oau3K4keBuwg', links={})
% endif