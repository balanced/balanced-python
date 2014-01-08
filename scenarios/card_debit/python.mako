% if mode == 'definition':
balanced.Card().debit()
% else:
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

card = balanced.Card.find('/cards/CC3q6xpE6zCz8OZTHcXYvHtS')
card.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% endif