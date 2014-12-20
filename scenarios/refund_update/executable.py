import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

refund = balanced.Refund.fetch('/refunds/RF4NfnDkA4JBeXex8N3ZDhMA')
refund.description = 'update this description'
refund.meta = {
  'user.refund.count': '3',
  'refund.reason': 'user not happy with product',
  'user.notes': 'very polite on the phone',
}
refund.save()