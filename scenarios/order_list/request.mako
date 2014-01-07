<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

orders = balanced.Order.query.all()