% if mode == 'definition':
balanced.Card.save()
% else:
import balanced

balanced.configure('b5de51921b2d11e389c4026ba7cac9da')


card = balanced.Card.find('/v1/marketplaces/TEST-MP5xnSCw6SffAgT7r9dYSGeP/cards/CC6bHZHMa2mDHFlBawUfKFvG')
card.meta = {
  'twitter.id': '1234987650',
  'facebook.user_id': '0192837465',
  'my-own-customer-id': '12345',
}
card.save()
% endif