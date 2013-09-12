<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

bank_account = balanced.BankAccount.find('${request['uri']}')
credit = bank_account.credit(amount=${request['payload']['amount']})