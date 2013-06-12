${main.python_boilerplate()}
customer = balanced.Customer.find('${request['uri']}')
customer.add_card('${payload['card_uri']}')