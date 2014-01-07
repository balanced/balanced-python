import balanced

balanced.configure('ak-test-1tUen2a604QT05iGc6p4pbPjTqsAPMFCl')

card = balanced.Card.find('/cards/CC6y7qpkXsrutTV0z1p4SbhI')
card_hold = card.hold(
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)