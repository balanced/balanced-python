<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

card = balanced.Card.fetch('${request['uri']}')
card.associate_to('${request['payload']['customer']}')