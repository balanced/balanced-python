import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA2Yl8BXIiDIdRGu75Ef2mhi')
bank_account.delete()