import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

card = balanced.Card.fetch('/cards/CC47wPIfNkploi0BbLRDqEYo')
card_hold = card.hold(
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)