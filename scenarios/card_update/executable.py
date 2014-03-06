import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

card = balanced.Card.fetch('/cards/CC4cbNzUmFqGrc1GmFpXp6fe')
card.meta = {
  'twitter.id': '1234987650',
  'facebook.user_id': '0192837465',
  'my-own-customer-id': '12345'
}
card.save()