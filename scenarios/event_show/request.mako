<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

event = balanced.Event.fetch('${request['uri']}')