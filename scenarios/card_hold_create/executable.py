import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

card = balanced.Card.fetch('/cards/CC4hAPsanjFP7QWIIAAPAwKh')
card_hold = card.hold(
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)