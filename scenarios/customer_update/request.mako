<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

customer = balanced.Debit.find('${request['uri']}')
customer.email = '${request['payload']['email']}'
customer.meta = {
  'shipping-preference': 'ground'
}
customer.save()