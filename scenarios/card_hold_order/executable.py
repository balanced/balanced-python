import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

order = balanced.Order.fetch('/orders/OR5sl2RJVnbwEf45nq5eATdz')
card = balanced.Card.fetch('/cards/CC33DRVrekWpiHYjxSdVuqWc')
card_hold = card.hold(
amount=5000,
  description='Some descriptive text for the debit in the dashboard',
  order='/orders/OR5sl2RJVnbwEf45nq5eATdz'
)