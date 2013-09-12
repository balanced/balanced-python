<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

buyer = balanced.Marketplace.my_marketplace.create_buyer(
  <% main.payload_expand(request['payload']) %>
)