% if mode == 'definition':
balanced.APIKey.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

key = balanced.APIKey.fetch('/api_keys/AK3zUFsQ8aJ3aae9ZylavXLp')
% endif