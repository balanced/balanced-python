% if mode == 'definition':

balanced.Card.save()
% else:
import balanced

balanced.configure("8386409cfeea11e2b3ee026ba7c1aba6")


card = balanced.Card.find('/v1/marketplaces/TEST-MP40BcQ7XUk3TlZOupT5Y3Nm/cards/CC4DcM3FqXvWA3oIzVgwrG2s')
card.meta = {
  'twitter.id': '1234987650',
  'facebook.user_id': '0192837465',
  'my-own-customer-id': '12345',
}
card.save()

% endif