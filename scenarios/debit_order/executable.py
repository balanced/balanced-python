import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

order = balanced.Order.fetch('/orders/OR2JfBYxYlDAF3L48u9DtIEU')
card = balanced.Card.fetch('/cards/CC48j1De9eVYELLivrgDeCM8')
order.debit_from(
    amount=5000,
    source=card,
)