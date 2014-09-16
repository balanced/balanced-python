% if mode == 'definition':
balanced.Callback().unstore()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

callback = balanced.Callback.fetch('/callbacks/CB3AuHtVP5mcxGS8OwnJwSrK')
callback.unstore()
% elif mode == 'response':

% endif