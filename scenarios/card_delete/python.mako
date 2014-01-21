% if mode == 'definition':
balanced.Card().unstore()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

card = balanced.Card.find('/cards/CC3q6xpE6zCz8OZTHcXYvHtS')
card.unstore()
% endif