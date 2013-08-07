${main.python_boilerplate()}
account = balanced.Account.find('${request['account_uri']}')
holds = account.holds.all()