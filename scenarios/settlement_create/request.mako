<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

payable_account = balanced.Account.fetch('${request['href']}')
payable_account.settle(
  appears_on_statement_as='${request['payload']['appears_on_statement_as']}',
  funding_instrument='${request['payload']['funding_instrument']}',
  description='${request['payload']['description']}',
  meta={
    'group': '${request['payload']['meta']['group']}'
  }
)
)