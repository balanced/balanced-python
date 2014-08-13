# bank_account_href_a is the stored href for the BankAccount for Person A
bank_account_person_a = balanced.BankAccount.fetch(bank_account_href_a)
credit = bank_account_person_a.credit(
    amount=50000,
    description='Payout for order #1111'
)

# bank_account_href_b is the stored href for the BankAccount for Person B
bank_account_person_b = balanced.BankAccount.fetch(bank_account_href_b)
credit = bank_account_person_b.credit(
    amount=50000,
    description='Payout for order #1111'
)