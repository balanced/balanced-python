import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA3gt4RLskm2w09aXHPDaCb3')
bank_account.meta = {
  'twitter.id'='1234987650',
  'facebook.user_id'='0192837465',
  'my-own-customer-id'='12345'
}
bank_account.save()