% if mode == 'definition':
balanced.Event.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

events = balanced.Event.query
% endif