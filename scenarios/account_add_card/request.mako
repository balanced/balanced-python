${main.python_boilerplate()}
account = balanced.Account.find('${request['uri']}')
account.add_card('${payload['card_uri']}')