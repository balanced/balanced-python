<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

credit = balanced.Credit.fetch('${request['uri']}')
credit.meta = {
  'twitter.id': '1234987650',
  'facebook.user_id': '0192837465',
  'my-own-customer-id': '12345'
}
credit.save()