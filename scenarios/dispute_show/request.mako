<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

dispute = balanced.Dispute.fetch('${request['uri']}')