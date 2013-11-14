% if mode == 'definition':
balanced.Account(...).save()
% else:
import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

buyer = balanced.Marketplace.my_marketplace.create_buyer(
  card_uri='/v1/marketplaces/TEST-MP52IlCmywk6hGbgS75QSlN/cards/CChliMH1lqlupiVghuXsWRq'
)
% endif