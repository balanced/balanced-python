import balanced

balanced.configure('ak-test-YnjW61zGxEdhpzkBcohFZ2bZhjrdtbDW')

order = balanced.Order.fetch('/orders/OR46RV9HyvE8esnGbLPkJKW4')
card = balanced.Card.fetch('/cards/CC2F37Ml3zzsjgM2Wb3R7zqM/credits')
order.credit_to(
    amount=5000,
    source=card,
)