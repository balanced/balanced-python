<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Refund.save()

% else:
${main.python_boilerplate()}
refund = balanced.Refund.find('${request['uri']}')
refund.description = '${payload['description']}'
refund.meta = {
% for k, v in payload['meta'].iteritems():
  '${k}': '${v}',
% endfor
}
refund.save()

% endif
