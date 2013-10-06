% if mode == 'definition':
balanced.Account(...).save()
% else:
import balanced

balanced.configure('ak-test-1p1Tsac7gHeMQowL2seB7ieliuAJAufyq')

buyer = balanced.Marketplace.my_marketplace.create_buyer(
  card_uri='/v1/marketplaces/TEST-MP5FKPQwyjvVgTDt7EiRw3Kq/cards/CC5T4qufAzoJFaHS2wcGlTeo'
)
% endif