<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

order = balanced.Order.fetch('${payload['order']}')
card = balanced.Card.fetch('${request['card_href']}')
order.debit_from(
    amount=5000,
    source=card,
)
