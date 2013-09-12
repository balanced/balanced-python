<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

customer = balanced.Customer.find('${request['uri']}')
holds = customer.holds.all()