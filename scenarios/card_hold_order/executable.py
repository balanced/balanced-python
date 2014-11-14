import balanced

balanced.configure('ak-test-YnjW61zGxEdhpzkBcohFZ2bZhjrdtbDW')

order = balanced.Order.fetch('/orders/OR46RV9HyvE8esnGbLPkJKW4')
card = balanced.Card.fetch('/cards/CC2vbVLAMwrNqlLvp3km6hq0')
card_hold = card.hold(
amount=5000,
  description='Some descriptive text for the debit in the dashboard',
  order='/orders/OR46RV9HyvE8esnGbLPkJKW4'
)