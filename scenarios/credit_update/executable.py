import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

credit = balanced.Credit.fetch('/credits/CR3yvp1R6162kK7MozoHmSkg')
credit.meta = {
  'twitter.id': '1234987650',
  'facebook.user_id': '0192837465',
  'my-own-customer-id': '12345'
}
credit.save()