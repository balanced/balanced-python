<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

hold = balanced.Hold.find('${request['hold_uri']}')
debit = hold.capture(
  <% main.payload_expand(request['payload']) %>
)