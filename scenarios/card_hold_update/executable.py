import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

card_hold = balanced.CardHold.fetch('/card_holds/HL4a1BKhDiVV9Ueh9MTozVDs')
card_hold.description = 'update this description'
card_hold.meta = {
  'holding.for': 'user1',
  'meaningful.key': 'some.value',
}
card_hold.save()