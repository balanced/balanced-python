${main.python_boilerplate()}
merchant = balanced.Account.find('${request['account_uri']}')
credits = merchant.credits.all()