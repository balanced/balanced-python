import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

order = balanced.Order.fetch('/orders/OR5EZkSOSTsmYJlJi6UlrUmp')
card = balanced.Card.fetch('/cards/CC526JELNk4pET43bVu6rGkZ')
order.debit_from(
    amount=5000,
    source=card,
)