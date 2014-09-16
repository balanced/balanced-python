import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA3bgtBxC3q4N9QvlN2jqFnL')
bank_account.associate_to_customer('/customers/CU36bqPshRNopkLNM6qBmn5e')