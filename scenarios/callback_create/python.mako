% if mode == 'definition':
balanced.Callback()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

callback = balanced.Callback(
  url='http://www.example.com/callback'
).save()
% endif