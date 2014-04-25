import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA3Y63fK5STwlhKNMkE3Utmd')
bank_account.credit(
  amount=5000
)