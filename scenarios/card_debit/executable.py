import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

card = balanced.Card.fetch('/cards/CC526JELNk4pET43bVu6rGkZ')
card.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)