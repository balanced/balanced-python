import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

card_hold = balanced.CardHold.fetch('/card_holds/HL3QlUen3sZjc3dPbgK40F7G')
card_hold.description = 'update this description'
card_hold.meta = {
  'holding.for': 'user1',
  'meaningful.key': 'some.value',
}
card_hold.save()