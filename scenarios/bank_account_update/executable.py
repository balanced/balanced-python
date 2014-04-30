import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA7sojXcP7oSdQyrjUA7wXg9')
bank_account.meta = {
  'twitter.id'='1234987650',
  'facebook.user_id'='0192837465',
  'my-own-customer-id'='12345'
}
bank_account.save()