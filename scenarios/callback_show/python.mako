% if mode == 'definition':
balanced.Callback.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

callback = balanced.Callback.fetch('/callbacks/CB40OMtABWHqkGcBEYpWVnAd')
% endif