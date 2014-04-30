import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

order = balanced.Order.fetch('/orders/OR1s2WQKp0shLH9Qb0LiUfEJ')
card = balanced.Card.fetch('/cards/CC1r57n36Fbiglw0OcSEkUcN')
order.debit_from(
    amount='5000',
    source=card,
)