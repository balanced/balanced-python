import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

order = balanced.Order.fetch('/orders/OR5QcYnwysJXQswImokq6ZSx')
bank_account = balanced.BankAccount.fetch('/bank_accounts/BA5KLH6jhFgtVENHXOcF3Cfj/credits')
order.credit_to(
    amount=5000,
    destination=bank_account
)