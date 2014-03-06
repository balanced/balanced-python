% if mode == 'definition':
balanced.APIKey()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

api_key = balanced.APIKey().save()
% endif