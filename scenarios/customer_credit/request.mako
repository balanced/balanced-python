<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

customer = balanced.Customer.find('${request['customer_uri']}')
customer.credit(amount=${request['payload']['amount']})