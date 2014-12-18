import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

order = balanced.Order.fetch('/orders/OR483MoeOnJEXwkxqoPdnDF3')
card = balanced.Card.fetch('/cards/CC5zxUdioIB0Dc2rjM1PK3Cw')
order.debit_from(
    amount=5000,
    source=card,
)