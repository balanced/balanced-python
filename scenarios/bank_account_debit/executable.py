import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA50LpPrCTB63Ecm0wEgdOQM')
bank_account.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)