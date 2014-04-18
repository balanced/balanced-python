% if mode == 'definition':
balanced.Callback.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

callback = balanced.Callback.fetch('/callbacks/CBwxLHWPLsoBqKqVyUvZRKp')
% elif mode == 'response':
Callback(links={}, url=u'http://www.example.com/callback', id=u'CBwxLHWPLsoBqKqVyUvZRKp', href=u'/callbacks/CBwxLHWPLsoBqKqVyUvZRKp', method=u'post', revision=u'1.1')
% endif