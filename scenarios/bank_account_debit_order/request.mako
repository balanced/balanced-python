<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

order = balanced.Order.fetch('${request['order_href']}')
bank_account = balanced.BankAccount.fetch('${request['bank_account_href']}')
order.debit_from(
    amount=${payload['amount']},
    source=bank_account,
)