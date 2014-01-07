<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>
verification = balanced.BankAccountVerification.find('${request['uri']}')
verification.amount_1 = 1
verification.amount_2 = 1
verification.save