<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

debit = balanced.Debit.fetch('${request['uri']}')

<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

order = balanced.Order.fetch('${request['uri']}')
card = balanced.Card.fetch('${request['card_href']}')
order..debit_from(
<% main.payload_expand(request['payload']) %>
)
