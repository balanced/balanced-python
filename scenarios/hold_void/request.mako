<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

hold = balanced.Hold.find('${request['uri']}')
hold.void()