<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Debit.save()

% else:
${main.python_boilerplate()}
debit = balanced.Debit.find('${request['uri']}')
debit.description = '${payload['description']}'
debit.meta = {
% for k, v in payload['meta'].iteritems():
  '${k}': '${v}',
% endfor
}
debit.save()

% endif
