% if mode == 'definition':
balanced.BankAccount.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

bank_accounts = balanced.BankAccount.query
% endif