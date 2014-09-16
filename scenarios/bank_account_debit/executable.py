import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA1BPjHr0Gjc62pLAlkYCH1b')
bank_account.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)