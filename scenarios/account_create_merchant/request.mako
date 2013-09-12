<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

account = balanced.Account.find('${request['uri']}')
account.add_bank_account('${request['payload']['bank_account_uri']}')