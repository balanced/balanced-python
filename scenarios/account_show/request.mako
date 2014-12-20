<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

account = balanced.Account.fetch('${request['uri']}')