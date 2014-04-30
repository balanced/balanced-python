import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

order = balanced.Order.fetch('/orders/OR1s2WQKp0shLH9Qb0LiUfEJ')
bank_account = balanced.BankAccount.fetch('/bank_accounts/BA1BnM6LmT9DLV4bZDIjUmHD')
order.credit_to(
    amount='5000',
    destination=bank_account
)