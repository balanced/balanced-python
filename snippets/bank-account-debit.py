# bank_account_href is the stored href for the BankAccount
# order_href is the stored href for the Order
bank_account = balanced.BankAccount.fetch(bank_account_href)
bank_account.debit(
    appears_on_statement_as='Statement text',
    amount=5000,
    description='Some descriptive text for the debit in the dashboard',
    order=order_href
)