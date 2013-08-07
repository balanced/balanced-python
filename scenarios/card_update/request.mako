${main.python_boilerplate()}
card = balanced.Card.find('${request['uri']}')
card.meta = {
% for k, v in payload['meta'].iteritems():
  '${k}': '${v}',
% endfor
}
card.save()