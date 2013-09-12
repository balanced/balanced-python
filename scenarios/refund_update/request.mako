<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

refund = balanced.Refund.find('${request['uri']}')
refund.description = '${request['payload']['description']}'
refund.meta = {
  'user.refund.count': '3',
  'refund.reason': 'user not happy with product',
  'user.notes': 'very polite on the phone',
}
refund.save()