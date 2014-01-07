<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

order = balanced.Order(
  <% main.payload_expand(request['payload']) %>
).save()