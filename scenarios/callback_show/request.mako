<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

callback = balanced.Callback.fetch('${request['uri']}')