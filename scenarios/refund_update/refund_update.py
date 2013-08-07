import balanced

balanced.configure("8386409cfeea11e2b3ee026ba7c1aba6")


refund = balanced.Refund.find('/v1/marketplaces/TEST-MP40BcQ7XUk3TlZOupT5Y3Nm/refunds/RF5IbmNudG8OWk1TzjdwmvOu')
refund.description = 'update this description'
refund.meta = {
  'user.refund.count': '3',
  'refund.reason': 'user not happy with product',
  'user.notes': 'very polite on the phone',
}
refund.save()