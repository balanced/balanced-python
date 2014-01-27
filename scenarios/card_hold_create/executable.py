import balanced

balanced.configure('ak-test-nngzAf2ARJV0AA4zzxdyVYJWRa0WLa5I')

card = balanced.Card.fetch('/cards/CC3hYX4uMMrNuO0lbYMY0PP9')
card_hold = card.hold(
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)