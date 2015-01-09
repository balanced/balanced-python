<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

settlement = balanced.Settlement.fetch('${request['uri']}')