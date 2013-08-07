${main.python_boilerplate()}
customer = balanced.Customer.find('${request['uri']}')
customer.add_bank_account('${payload['bank_account_uri']}')