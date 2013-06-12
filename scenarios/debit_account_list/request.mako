${main.python_boilerplate()}
account = balanced.Account.find('${request['uri']}')
debits = account.debits.all()