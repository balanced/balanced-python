<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

hold = balanced.Hold.find('${request['uri']}')
hold.description = '${request['payload']['description']}'
hold.meta = {
  'holding.for': 'user1',
  'meaningful.key': 'some.value',
}
hold.save()