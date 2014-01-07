<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

key = balanced.APIKey.find('${request['uri']}')