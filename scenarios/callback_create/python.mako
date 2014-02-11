% if mode == 'definition':
balanced.Callback()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

callback = balanced.Callback(
  url='http://www.example.com/callback'
).save()
% elif mode == 'response':
Callback(
 'href': u'/callbacks/CB224374R2NSyoYBpDV4r7C2',
 'id': u'CB224374R2NSyoYBpDV4r7C2',
 'links': {},
 'method': u'post',
 'revision': u'1.1',
 'url': u'http://www.example.com/callback')
 
% endif