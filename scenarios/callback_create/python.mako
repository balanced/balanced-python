% if mode == 'definition':
balanced.Callback()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

callback = balanced.Callback(
  url='http://www.example.com/callback',
  method='post'
).save()
% elif mode == 'response':
Callback(links={}, url=u'http://www.example.com/callback', id=u'CB44XaMOcxsUnuQoA5A4VKCx', href=u'/callbacks/CB44XaMOcxsUnuQoA5A4VKCx', method=u'post', revision=u'1.1')
% endif