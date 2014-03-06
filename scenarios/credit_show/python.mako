% if mode == 'definition':
balanced.Credit.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

credit = balanced.Credit.fetch('/credits/CR4wyLukORa0TXhCYtjZrfw5')
% endif