import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

card = balanced.Card.find('/v1/marketplaces/TEST-MP52IlCmywk6hGbgS75QSlN/cards/CC1i5vMNFo69BmOfBWcx5iZM')
card.meta = {
  'twitter.id': '1234987650',
  'facebook.user_id': '0192837465',
  'my-own-customer-id': '12345',
}
card.save()