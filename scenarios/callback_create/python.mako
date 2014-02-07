% if mode == 'definition':
balanced.Callback()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

callback = balanced.Callback(
  url='http://www.example.com/callback'
).save()
% elif mode == 'response':
{u'links': {}, u'url': u'http://www.example.com/callback', u'method': u'post', u'href': u'/callbacks/CB224374R2NSyoYBpDV4r7C2', u'id': u'CB224374R2NSyoYBpDV4r7C2', u'revision': u'1.1'}
% endif