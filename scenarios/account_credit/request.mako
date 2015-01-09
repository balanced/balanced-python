<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

payable_account = balanced.Account.fetch('${request['href']}')
payable_account.credit(
  appears_on_statement_as='${request['payload']['appears_on_statement_as']}',
  amount=${request['payload']['amount']},
  description='${request['payload']['description']}',
  order='${request['payload']['order']}',
  meta={
    'rating': '${request['payload']['meta']['rating']}'
  }
)