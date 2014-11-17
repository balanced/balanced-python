import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

order = balanced.Order.fetch('/orders/OR2UWXCNY2nKlqIQhQhWN3Jm')
card = balanced.Card.fetch('/cards/CC33DRVrekWpiHYjxSdVuqWc')
order.debit_from(
    amount=5000,
    source=card,
)