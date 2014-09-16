<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

bank_account = balanced.BankAccount.fetch('${request['uri']}')
bank_account.associate_to_customer('${request['payload']['customer']}')