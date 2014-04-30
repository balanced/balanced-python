<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

order = balanced.Order.fetch('${payload['order']}')
bank_account = balanced.BankAccount.fetch('${request['bank_account_href']}')
order.credit_to(
    amount=5000,
    destination=bank_account
)