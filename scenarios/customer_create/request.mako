<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

customer = balanced.Customer(
  <% main.payload_expand(request['payload']) %>
).save()