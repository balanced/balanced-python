import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA3LBmizwthrjehivn2ffzHU')
bank_account.delete()