import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

order = balanced.Order.fetch('/orders/OR5sl2RJVnbwEf45nq5eATdz')
bank_account = balanced.BankAccount.fetch('/bank_accounts/BA17zYxBNrmg9isvicjz9Ae4')
order.debit_from(
    amount=5000,
    source=bank_account,
)