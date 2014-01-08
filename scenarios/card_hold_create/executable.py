import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

card = balanced.Card.find('/cards/CC3cqYicdXFN8T1nX3frfRCW')
card_hold = card.hold(
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)