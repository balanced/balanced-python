${main.python_boilerplate()}
customer =  balanced.Customer.find('${request['customer_uri']}')
customer.credit(${payload['amount']})