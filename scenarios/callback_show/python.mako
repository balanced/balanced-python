% if mode == 'definition':
balanced.Callback.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

callback = balanced.Callback.fetch('/callbacks/CB4a7Q7HSdJJgMVHwPsarIw8')
% elif mode == 'response':
Callback(links={}, url=u'http://www.example.com/callback_test', id=u'CB4a7Q7HSdJJgMVHwPsarIw8', href=u'/callbacks/CB4a7Q7HSdJJgMVHwPsarIw8', method=u'post', revision=u'1.1')
% endif