% if mode == 'definition':

balanced.Card.save()
% else:
import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")


card = balanced.Card.find('/v1/marketplaces/TEST-MP29J5STPtZVvnjAFndM0N62/cards/CC2thwNijAS2qdwoWtqanNh6')
card.meta = {
  'twitter.id': '1234987650',
  'facebook.user_id': '0192837465',
  'my-own-customer-id': '12345',
}
card.save()

% endif