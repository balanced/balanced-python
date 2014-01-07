<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

refunds = balanced.Refund.query.all()