${main.python_boilerplate()}
customer = balanced.Customer.find('${request['customer_uri']}')
credits = customer.credits.all()