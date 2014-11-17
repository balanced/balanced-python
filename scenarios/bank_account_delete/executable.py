import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA1D19WqGc3j78IAhFIkasQd')
bank_account.delete()