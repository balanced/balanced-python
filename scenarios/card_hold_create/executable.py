import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

card = balanced.Card.fetch('/cards/CC2abDOQVm5aNFhHpcRvWS02')
card_hold = card.hold(
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)