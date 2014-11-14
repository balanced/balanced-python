import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

card = balanced.Card.fetch('/cards/CC2E1bHjwNbYtzUcTAmH4kEM')
card_hold = card.hold(
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)