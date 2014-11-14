% if mode == 'definition':
balanced.Callback.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

callback = balanced.Callback.fetch('/callbacks/CB2xCnObyAUU1V658GVuRyCI')
% elif mode == 'response':
Callback(links={}, url=u'http://www.example.com/callback', id=u'CB2xCnObyAUU1V658GVuRyCI', href=u'/callbacks/CB2xCnObyAUU1V658GVuRyCI', method=u'post', revision=u'1.1')
% endif