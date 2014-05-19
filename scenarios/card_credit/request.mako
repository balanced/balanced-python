<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

card = balanced.Card.fetch('${request['card_href']}')
card.credit(
  <% main.payload_expand(request['payload']) %>
)

