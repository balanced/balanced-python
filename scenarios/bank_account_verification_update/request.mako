<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

verification = balanced.BankAccountVerification.fetch('${request['uri']}')
verification.verify(amount_1=1, amount_2=1)