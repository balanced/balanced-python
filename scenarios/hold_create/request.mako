<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

hold = balanced.Hold(
  <% main.payload_expand(request['payload']) %>
)
hold.save()
