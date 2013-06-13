% if mode == 'definition':

balanced.Account(...).save()
% else:
import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")


buyer = balanced.Marketplace.my_marketplace.create_buyer(
    card_uri='/v1/marketplaces/TEST-MP29J5STPtZVvnjAFndM0N62/cards/CC1SAhs8uur7HA0JoyocY7Cw',
)

% endif