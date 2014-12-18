<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

bank_account = balanced.BankAccount.fetch('${request['bank_account_href']}')
credits = bank_account.credits