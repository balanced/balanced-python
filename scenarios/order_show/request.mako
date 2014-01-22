<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

order = balanced.Order.fetch('${request['uri']}')