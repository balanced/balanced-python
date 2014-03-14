import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

card = balanced.Card.fetch('/cards/CC5Buki6e4Kg4bDVZ3OSfQ8O')
card.meta = {
  'twitter.id': '1234987650',
  'facebook.user_id': '0192837465',
  'my-own-customer-id': '12345'
}
card.save()