${main.python_boilerplate()}
account = balanced.Account.find('${request['uri']}')
account.add_bank_account('${payload['bank_account_uri']}')