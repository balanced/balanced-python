import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA4GVxlUHmn8y0CjAUEcW6Kp')
bank_account.meta = {
  'twitter.id'='1234987650',
  'facebook.user_id'='0192837465',
  'my-own-customer-id'='12345'
}
bank_account.save()