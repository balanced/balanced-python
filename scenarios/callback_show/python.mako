% if mode == 'definition':
balanced.Callback.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

callback = balanced.Callback.fetch('/callbacks/CB3AuHtVP5mcxGS8OwnJwSrK')
% elif mode == 'response':
Callback(links={}, url=u'http://www.example.com/callback', id=u'CB3AuHtVP5mcxGS8OwnJwSrK', href=u'/callbacks/CB3AuHtVP5mcxGS8OwnJwSrK', method=u'post', revision=u'1.1')
% endif