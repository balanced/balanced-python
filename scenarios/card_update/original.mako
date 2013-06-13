<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Card.save()

% else:
${main.python_boilerplate()}
card = balanced.Card.find('${request['uri']}')
card.meta = {
% for k, v in payload['meta'].iteritems():
  '${k}': '${v}',
% endfor
}
card.save()

% endif
