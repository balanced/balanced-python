import balanced

balanced.configure('ak-test-YnjW61zGxEdhpzkBcohFZ2bZhjrdtbDW')

order = balanced.Order.fetch('/orders/OR46RV9HyvE8esnGbLPkJKW4')
bank_account = balanced.BankAccount.fetch('/bank_accounts/BA1FYgj0UJZfgydhl3X65RKR')
order.debit_from(
    amount=5000,
    source=bank_account,
)