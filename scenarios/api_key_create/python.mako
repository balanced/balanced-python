% if mode == 'definition':
balanced.APIKey()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

api_key = balanced.APIKey().save()
% elif mode == 'response':
APIKey(links={}, created_at=u'2014-09-02T18:22:50.910606Z', secret=u'ak-test-12V4LX8TtvvFnoZBNaf4WkgpbZr19E9iw', href=u'/api_keys/AK19Ap0xmiz0Oau3K4keBuwg', meta={}, id=u'AK19Ap0xmiz0Oau3K4keBuwg')
% endif