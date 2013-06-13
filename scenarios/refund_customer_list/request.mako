${main.python_boilerplate()}
customer = balanced.Customer.find('${request['customer_uri']}')
refunds = customer.refunds.all()