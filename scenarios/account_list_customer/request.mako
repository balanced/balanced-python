<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

customer = balanced.Customer.fetch('${request['customer_href']}')
customer.accounts