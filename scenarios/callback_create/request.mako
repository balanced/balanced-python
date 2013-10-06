<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

callback = balanced.Callback(
  <% main.payload_expand(request['payload']) %>
).save()