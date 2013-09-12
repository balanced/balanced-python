<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

card = balanced.Card(
  <% main.payload_expand(request['payload']) %>
).save()