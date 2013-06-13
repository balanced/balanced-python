${main.python_boilerplate()}
customer = balanced.Customer.find('${request['uri']}')
debits = customer.debits.all()