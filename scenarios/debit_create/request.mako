<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

customer = balanced.Customer.find('${request['customer_uri']}')
customer.debit(
  <% main.payload_expand(request['payload']) %>
)