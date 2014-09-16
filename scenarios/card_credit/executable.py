import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

card = balanced.Card.fetch('/cards/CC5uc1B6fJPQBSJUi0m58tal')
card.credit(
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)