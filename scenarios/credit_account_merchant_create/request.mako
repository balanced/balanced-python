${main.python_boilerplate()}
merchant =  balanced.Account.find('${request['account_uri']}')
merchant.credit(${payload['amount']})