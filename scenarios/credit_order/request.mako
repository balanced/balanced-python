<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

order = balanced.Order.fetch('${request['uri']}')
bank_account = balanced.BankAccount.fetch('${request['bank_account_href']}')
order.credit_to(
<% main.payload_expand(request['payload']) %>
)