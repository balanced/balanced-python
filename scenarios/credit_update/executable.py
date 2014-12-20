import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

credit = balanced.Credit.fetch('/credits/CR4ooRjxfFr0h6ubhNyETByJ')
credit.meta = {
  'twitter.id': '1234987650',
  'facebook.user_id': '0192837465',
  'my-own-customer-id': '12345'
}
credit.save()