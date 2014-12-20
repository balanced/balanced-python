import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

order = balanced.Order.fetch('/orders/OR2JfBYxYlDAF3L48u9DtIEU')
card = balanced.Card.fetch('/cards/CC4fWSr1PpCAh6mlDzNfr0Gs')
order.credit_to(
    amount=5000,
    source=card,
)