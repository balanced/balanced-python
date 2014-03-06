% if mode == 'definition':
balanced.Refund.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

refunds = balanced.Refund.query
% endif