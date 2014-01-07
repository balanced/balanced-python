<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

reversal = balanced.Reversal.find('${request['uri']}')
reversal.description = '${request['payload']['description']}'
reversal.meta = {
  'user.refund.count': '3',
  'refund.reason': 'user not happy with product',
  'user.notes': 'very polite on the phone',
}
reversal.save()