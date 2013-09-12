<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>
verification = balanced.BankAccountVerification.find('${request['uri']}')