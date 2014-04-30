import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA7lb2roygfhwDfbvikDLcHP')
verification = bank_account.verify()