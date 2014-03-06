% if mode == 'definition':
balanced.BankAccount.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA3LBmizwthrjehivn2ffzHU')
% endif