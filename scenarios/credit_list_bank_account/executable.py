import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA2slfzsDvZRXkfl2C3pbN9S/credits')
credits = bank_account.credits