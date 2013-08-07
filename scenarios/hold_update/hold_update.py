import balanced

balanced.configure("8386409cfeea11e2b3ee026ba7c1aba6")


hold = balanced.Hold.find('/v1/marketplaces/TEST-MP40BcQ7XUk3TlZOupT5Y3Nm/holds/HL5rHLGFY2NMLve5y2yPJC06')
hold.description = 'update this description'
hold.meta = {
  'holding.for': 'user1',
  'meaningful.key': 'some.value',
}
hold.save()