import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA45anEaEr8g0lOhzhcE9VAN')
bank_account.associate_to_customer('/customers/CU3o1ZAd8Gtxz6ZTIFK9YmsM')