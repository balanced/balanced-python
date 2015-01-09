import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

order = balanced.Order.fetch('/orders/OR3vURGwVtqDnnkRS9fgH41G')
card = balanced.Card.fetch('/cards/CC4zyuNpxY0A0eAf87SeULCR')
order.debit_from(
    amount=5000,
    source=card,
)