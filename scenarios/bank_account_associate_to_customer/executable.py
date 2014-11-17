import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA2gul8YMjFWnFk0fFHXwX6g')
bank_account.associate_to_customer('/customers/CU2718cI8PkMdFyPjboZLZfn')