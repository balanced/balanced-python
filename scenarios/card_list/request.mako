<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

cards = balanced.Card.query.all();