import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

order = balanced.Order.fetch('/orders/OR2JfBYxYlDAF3L48u9DtIEU')
bank_account = balanced.BankAccount.fetch('/bank_accounts/BA305R4Vwumo1KjT9kwVrdfT')
order.debit_from(
    amount=5000,
    source=bank_account,
)