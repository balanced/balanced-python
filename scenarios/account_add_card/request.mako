<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

account = balanced.Account.find('${request['uri']}')
account.add_card('${request['payload']['card_uri']}')