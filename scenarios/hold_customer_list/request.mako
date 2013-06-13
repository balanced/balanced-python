${main.python_boilerplate()}
customer = balanced.Customer.find('${request['customer_uri']}')
holds = customer.holds.all()