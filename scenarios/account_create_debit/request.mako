${main.python_boilerplate()}
account = balanced.Account.find('${request['account_uri']}')
account.debit(amount='${payload['amount']}')