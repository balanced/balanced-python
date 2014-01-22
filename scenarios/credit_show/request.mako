<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

credit = balanced.Credit.fetch('${request['uri']}')