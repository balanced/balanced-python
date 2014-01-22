<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

card_hold = balanced.CardHold.fetch('${request['uri']}')