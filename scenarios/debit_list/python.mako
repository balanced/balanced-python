% if mode == 'definition':
balanced.Debit.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

debits = balanced.Debit.query
% endif