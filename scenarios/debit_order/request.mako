<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

order = balanced.Order.fetch('${request['order_href']}')
card = balanced.Card.fetch('${request['card_href']}')
order.debit_from(
    amount='${payload['amount']}',
    source=card,
)
