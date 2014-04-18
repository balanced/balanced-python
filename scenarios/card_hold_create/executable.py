import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

card = balanced.Card.fetch('/cards/CCCk1CEzUN0gDA5qh8um0rv')
card_hold = card.hold(
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)