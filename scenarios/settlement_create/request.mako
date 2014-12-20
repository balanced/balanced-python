<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

payable_account = balanced.Account.fetch('${request['href']}')
payable_account.settle(
  <% main.payload_expand(request['payload']) %>
)