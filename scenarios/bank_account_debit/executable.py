import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA7lb2roygfhwDfbvikDLcHP')
bank_account.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)