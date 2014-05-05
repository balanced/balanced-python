<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

order = balanced.Order.fetch('${request['order_href']}')
bank_account = balanced.BankAccount.fetch('${request['bank_account_href']}')
order.credit_to(
    amount='${payload['amount']}',
    destination=bank_account
)