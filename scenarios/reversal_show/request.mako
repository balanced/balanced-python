<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

refund = balanced.Reversal.fetch('${request['uri']}')