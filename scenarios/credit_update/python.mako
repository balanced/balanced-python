% if mode == 'definition':
balanced.Credit().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

credit = balanced.Credit.fetch('/credits/CR4wyLukORa0TXhCYtjZrfw5')
credit.meta = {
  'twitter.id': '1234987650',
  'facebook.user_id': '0192837465',
  'my-own-customer-id': '12345'
}
credit.save()
% endif