import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

order = balanced.Order.fetch('/orders/OR5QcYnwysJXQswImokq6ZSx')
card = balanced.Card.fetch('/cards/CC5OD6648yiKfSzfj6z6MdXr')
order.debit_from(
    amount='5000',
    source=card,
)