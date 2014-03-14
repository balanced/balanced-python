% if mode == 'definition':
balanced.Callback()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

callback = balanced.Callback(
  url='http://www.example.com/callback',
  method='post'
).save()
% elif mode == 'response':
Callback(links={}, url=u'http://www.example.com/callback', id=u'CB5pnz4XnaDpRFGlNMb6u50R', href=u'/callbacks/CB5pnz4XnaDpRFGlNMb6u50R', method=u'post', revision=u'1.1')
% endif