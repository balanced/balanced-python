% if mode == 'definition':
balanced.Callback()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

callback = balanced.Callback(
  url='http://www.example.com/callback',
  method='post'
).save()
% elif mode == 'response':
Callback(links={}, url=u'http://www.example.com/callback', id=u'CB3BP8jjVy8RBUFdb2fYw0mh', href=u'/callbacks/CB3BP8jjVy8RBUFdb2fYw0mh', method=u'post', revision=u'1.1')
% endif