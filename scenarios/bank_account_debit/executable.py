import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA3EMnkybAfEzVlbVquXFLEk')
bank_account.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)