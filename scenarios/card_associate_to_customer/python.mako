% if mode == 'definition':
balanced.Card().associate_to_customer()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

card = balanced.Card.fetch('/cards/CC3q6xpE6zCz8OZTHcXYvHtS')
card.associate_to_customer('/customers/CU4xIyjtjtamnhjJ0E6iW3Kq')
% endif