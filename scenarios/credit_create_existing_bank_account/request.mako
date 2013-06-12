${main.python_boilerplate()}
bank_account = balanced.BankAccount.find('${request['uri']}')
credit = bank_account.credit(${payload['amount']})