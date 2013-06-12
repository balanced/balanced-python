${main.python_boilerplate()}
bank_account = balanced.BankAccount.find('${request['uri']}')
credits = bank_account.credits.all()