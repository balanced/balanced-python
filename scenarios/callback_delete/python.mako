% if mode == 'definition':
balanced.Callback().unstore()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

callback = balanced.Callback.fetch('/callbacks/CBwxLHWPLsoBqKqVyUvZRKp')
callback.unstore()
% elif mode == 'response':

% endif