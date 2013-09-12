% if mode == 'definition':
balanced.Account(...).save()
% else:
import balanced

balanced.configure('b5de51921b2d11e389c4026ba7cac9da')


buyer = balanced.Marketplace.my_marketplace.create_buyer(
  card_uri='/v1/marketplaces/TEST-MP5xnSCw6SffAgT7r9dYSGeP/cards/CC5GilLPTp4N4vYHwzwGEsR9'
)
% endif