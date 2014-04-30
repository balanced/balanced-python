import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

card = balanced.Card.fetch('/cards/CC7JlMyXyZ8W3RBfE1SSlnrD')
card_hold = card.hold(
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)