import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

order = balanced.Order.fetch('/orders/OR3BXTqXewuSy1Cu3g6N2Sjj')
bank_account = balanced.BankAccount.fetch('/bank_accounts/BA2gul8YMjFWnFk0fFHXwX6g/credits')
order.credit_to(
    amount=5000,
    destination=bank_account
)