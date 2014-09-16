import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

order = balanced.Order.fetch('/orders/OR5EZkSOSTsmYJlJi6UlrUmp')
bank_account = balanced.BankAccount.fetch('/bank_accounts/BA3bgtBxC3q4N9QvlN2jqFnL/credits')
order.credit_to(
    amount=5000,
    destination=bank_account
)