% if mode == 'definition':
balanced.Reversal.query()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

reversals = balanced.Reversal.query
% endif