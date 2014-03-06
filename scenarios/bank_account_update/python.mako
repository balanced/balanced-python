% if mode == 'definition':
balanced.BankAccount().debit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA3LBmizwthrjehivn2ffzHU')
bank_account.meta = {
  'twitter.id'='1234987650',
  'facebook.user_id'='0192837465',
  'my-own-customer-id'='12345'
}
bank_account.save()
% endif