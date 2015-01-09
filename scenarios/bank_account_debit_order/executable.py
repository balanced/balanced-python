import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

order = balanced.Order.fetch('/orders/OR3vURGwVtqDnnkRS9fgH41G')
bank_account = balanced.BankAccount.fetch('/bank_accounts/BA3LVXVgJLrzkmB3vUntKJ6t')
order.debit_from(
    amount=5000,
    source=bank_account,
)