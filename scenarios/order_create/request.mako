<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

merchant_customer = balanced.Customer.fetch('${request['customer_href']}')
merchant_customer.create_order(
  <% main.payload_expand(request['payload']) %>
).save()