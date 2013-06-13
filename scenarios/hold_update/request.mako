import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")


hold = balanced.Hold.find('/v1/marketplaces/TEST-MP29J5STPtZVvnjAFndM0N62/holds/HL37VojBNnK7JE1PrViGScmQ')
hold.description = 'update this description'
hold.meta = {
  'holding.for': 'user1',
  'meaningful.key': 'some.value',
}
hold.save()