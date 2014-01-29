<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

card_hold = balanced.CardHold.fetch('${request['card_hold_href']}')
debit = card_hold.capture(
  <% main.payload_expand(request['payload']) %>
)