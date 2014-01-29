<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

card_hold = balanced.CardHold.fetch('${request['uri']}')
card_hold.description = '${request['payload']['description']}'
card_hold.meta = {
  'holding.for': 'user1',
  'meaningful.key': 'some.value',
}
card_hold.save()