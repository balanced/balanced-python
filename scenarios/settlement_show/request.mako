<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

account = balanced.Settlement.fetch('${request['uri']}')