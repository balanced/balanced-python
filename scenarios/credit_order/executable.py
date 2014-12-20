import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

order = balanced.Order.fetch('/orders/OR2JfBYxYlDAF3L48u9DtIEU')
bank_account = balanced.BankAccount.fetch('/bank_accounts/BA3uzbngfVXy1SGg25Et7iKY/credits')
order.credit_to(
    amount=5000,
    destination=bank_account
)