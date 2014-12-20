import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

order = balanced.Order.fetch('/orders/OR2JfBYxYlDAF3L48u9DtIEU')
card = balanced.Card.fetch('/cards/CC2IDFuWSoETEIxLBJ73fXgs')
card_hold = card.hold(
amount=5000,
  description='Some descriptive text for the debit in the dashboard',
  order='/orders/OR2JfBYxYlDAF3L48u9DtIEU'
)