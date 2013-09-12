<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

customer = balanced.Customer.find('${request['uri']}')
customer.add_bank_account('${request['payload']['bank_account_uri']}')