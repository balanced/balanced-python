${main.python_boilerplate()}
account = balanced.Account.find('${request['account_uri']}')
account.hold(amount='${payload['amount']}')