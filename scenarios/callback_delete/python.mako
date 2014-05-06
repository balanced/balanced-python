% if mode == 'definition':
balanced.Callback().unstore()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

callback = balanced.Callback.fetch('/callbacks/CB7DP9sW9wRe19dFRutynahb')
callback.unstore()
% elif mode == 'response':

% endif