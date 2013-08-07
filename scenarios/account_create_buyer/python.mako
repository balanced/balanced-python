% if mode == 'definition':

balanced.Account(...).save()
% else:
import balanced

balanced.configure("8386409cfeea11e2b3ee026ba7c1aba6")


buyer = balanced.Marketplace.my_marketplace.create_buyer(
    card_uri='/v1/marketplaces/TEST-MP40BcQ7XUk3TlZOupT5Y3Nm/cards/CC5WnLs62QL0arljSl7Q5LVC',
)

% endif