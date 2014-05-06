% if mode == 'definition':
balanced.Callback.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

callback = balanced.Callback.fetch('/callbacks/CB7DP9sW9wRe19dFRutynahb')
% elif mode == 'response':
Callback(links={}, url=u'http://www.example.com/callback', id=u'CB7DP9sW9wRe19dFRutynahb', href=u'/callbacks/CB7DP9sW9wRe19dFRutynahb', method=u'post', revision=u'1.1')
% endif