import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

order = balanced.Order.fetch('/orders/OR2UWXCNY2nKlqIQhQhWN3Jm')
card = balanced.Card.fetch('/cards/CC3IBNr3erYpVuuZDyWNFfet')
order.credit_to(
    amount=5000,
    source=card,
)