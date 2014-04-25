import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

card = balanced.Card.fetch('/cards/CC4auQXiAWMBxJcEUIMYeZFj')
card_hold = card.hold(
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)