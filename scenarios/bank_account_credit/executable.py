import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

bank_account = balanced.BankAccount.find('/bank_accounts/BA3VFGbCg9X5lAzg2FdMhr5w')
bank_account.credit(
  amount=2000
)