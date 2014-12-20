import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

card = balanced.Card.fetch('/cards/CC2IDFuWSoETEIxLBJ73fXgs')
card_hold = card.hold(
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)