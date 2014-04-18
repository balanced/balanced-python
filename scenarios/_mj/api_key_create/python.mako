% if mode == 'definition':
balanced.APIKey

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

api_key = balanced.APIKey()
api_key.save()
% elif mode == 'response':
APIKey(links={}, created_at=u'2014-04-17T22:38:39.103798Z', secret=u'ak-test-1DSRO02OhucdVxve32NKh57AHNr4kmhb', href=u'/api_keys/AK7KGjv4YKtOf03Lqm0f84V', meta={}, id=u'AK7KGjv4YKtOf03Lqm0f84V')
% endif