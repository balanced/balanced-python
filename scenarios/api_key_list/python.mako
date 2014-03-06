% if mode == 'definition':
balanced.APIKey.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

keys = balanced.APIKey.query
% endif